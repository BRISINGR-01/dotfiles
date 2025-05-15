import chalk from "chalk";
import { execSync, spawn, spawnSync } from "child_process";
import fs from "fs";
import path from "path";
import readline from "readline-sync";

function outToString(out) {
	return out.toString().replace(/\n$/, "").trim();
}

const cmd = {
	params: process.argv.slice(2),
	parameter: process.argv[2],
	run(command) {
		try {
			execSync(command);
		} catch (e) {}

		return this;
	},
	wait(n) {
		execSync(`sleep ${n}`);
		return this;
	},
	spawn(command) {
		try {
			const process = spawn(command, [...arguments].slice(1), {
				detached: true, // Runs independently
				stdio: "ignore", // Prevents Node from waiting for output
			});

			process.unref();
			return process.pid;
		} catch (e) {}
	},
	num(command) {
		return parseInt(execSync(command));
	},
	bool(command) {
		try {
			return !!execSync(command);
		} catch (e) {
			return false;
		}
	},
	str(command) {
		try {
			return outToString(execSync(command));
		} catch (e) {
			return "";
		}
	},
	json(command) {
		return JSON.parse(this.str(command));
	},
	fzf(command) {
		try {
			return outToString(
				spawnSync("fzf", {
					input: command.join("\n"),
					encoding: "utf8",
				}).stdout
			);
		} catch (e) {
			return "";
		}
	},
	tv(command) {
		try {
			console.log(`echo "${command.join("\n").replace(/\$/g, "\\$")}" | tv`);
			execSync("tv", ["list-channels"]);
			// return spawn(`echo "${command.join("\n").replace(/\$/g, "\\$")}" | tv`);
		} catch (e) {
			return "";
		}
	},
	isRunning(command) {
		return this.bool(`pgrep "${command}"`);
	},
	/**
	 * @param {string} message
	 * @param {{ color: "black" | "red" | "green" | "yellow" | "blue" | "cyan" | "magenta" | "white" | "gray" | "grey" | "blackBright" | "redBright" | "greenBright" | "yellowBright" | "blueBright" | "cyanBright" | "magentaBright" | "whiteBright", bold: boolean }} options
	 */
	prompt(message, options = {}) {
		if (!message) return;

		const { color, bold } = options;
		if (color) {
			message = chalk[color](message);
		}
		if (bold) {
			message = chalk.bold(message);
		}

		return readline.question(message + " ");
	},

	/**
	 * @param {string} message
	 * @param {{ color: "black" | "red" | "green" | "yellow" | "blue" | "cyan" | "magenta" | "white" | "gray" | "grey" | "blackBright" | "redBright" | "greenBright" | "yellowBright" | "blueBright" | "cyanBright" | "magentaBright" | "whiteBright", bold: boolean }} options
	 */
	print(message, options = {}) {
		if (!message) return this;

		const { color, bold } = options;
		if (color) {
			message = chalk[color](message);
		}
		if (bold) {
			message = chalk.bold(message);
		}

		console.log(message);
		return this;
	},
	error(message) {
		return this.print(message, { color: "red", bold: true });
	},
	exit(code = 0) {
		process.exit(code);
	},
	notify(message) {
		this.spawn("notify-send", "-e", message);
		return this;
	},
	read(p) {
		if (!p.startsWith("/") && !p.startsWith("~")) p = path.resolve(process.cwd(), p);
		return fs.readFileSync(p, "utf8").toString();
	},
	writeTo(p, data) {
		if (!p.startsWith("/") && !p.startsWith("~")) p = path.resolve(process.cwd(), p);
		fs.writeFileSync(p, data);
		return this;
	},
	dotfilesDir: path.resolve("/home", process.env.USER, "dotfiles"),
	currentDir: process.cwd(),
};

export default cmd;

export function copy(text) {
	cmd.spawn("wl-copy", text);
}

export function paste() {
	cmd.spawn("ydotool", "key", "29:1", "47:1", "47:0", "29:0");
}
