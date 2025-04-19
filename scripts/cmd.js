import chalk from "chalk";
import { execSync, spawn } from "child_process";
import fs from "fs";
import path from "path";
import readline from "readline-sync";

function outToString(out) {
	return out.toString().replace(/\n$/, "").trim();
}

export default {
	params: process.argv.slice(2),
	parameter: process.argv[2],
	run(command) {
		try {
			execSync(command);
			return true;
		} catch (e) {
			return false;
		}
	},
	wait(n) {
		execSync(`sleep ${n}`);
	},
	spawn(command) {
		try {
			console.log(...arguments);
			const process = spawn(command, [...arguments].slice(1), {
				detached: true, // Runs independently
				stdio: "ignore", // Prevents Node from waiting for output
			});

			process.unref();
			return true;
		} catch (e) {
			console.log(e);
			this.notify(e.message);
			return false;
		}
	},
	num(command) {
		return parseInt(execSync(command));
	},
	bool(command) {},
	str(command) {
		try {
			return outToString(execSync(command));
		} catch (e) {
			return "";
		}
	},
	fzf(command) {
		try {
			return outToString(execSync(`echo "${command.join("\n")}" | fzf`));
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
		if (!message) return;

		const { color, bold } = options;
		if (color) {
			message = chalk[color](message);
		}
		if (bold) {
			message = chalk.bold(message);
		}

		console.log(message);
	},
	exit(code = 0) {
		process.exit(code);
	},
	notify(message) {
		this.run(`notify-send "${message}"`);
	},
	read(p) {
		if (!p.startsWith("/") && !p.startsWith("~")) p = path.resolve(process.cwd(), p);
		return fs.readFileSync(p, "utf8").toString();
	},
	writeTo(p, data) {
		if (!p.startsWith("/") && !p.startsWith("~")) p = path.resolve(process.cwd(), p);
		return fs.writeFileSync(p, data);
	},
	dotfilesDir: path.resolve("/home", process.env.USER, "dotfiles"),
};
