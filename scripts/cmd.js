import chalk from "chalk";
import { execSync, spawn, spawnSync } from "child_process";
import fs from "fs";
import path from "path";
import readline from "readline-sync";

const DATA_FILE = path.resolve("/home", process.env.USER, "user-data.json");

function checkDataFile() {
	if (!fs.existsSync(DATA_FILE) || !fs.statSync(DATA_FILE).size) {
		fs.writeFileSync(DATA_FILE, "{}");
	}
}

export function outToString(out) {
	return out.toString().replace(/\n$/, "").trim();
}

const cmd = {
	params: process.argv.slice(2),
	parameter: process.argv[2],
	dotfilesDir: path.resolve("/home", process.env.USER, "dotfiles"),
	currentDir: process.cwd(),
	register(description) {
		if (this.parameter == "--help" || this.parameter == "-h") {
			console.log(description);
			this.exit();
		}
	},
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
		} catch (e) {
			spawn("notify-send", "-e", e.message);
		}
	},
	spawnSync(command) {
		spawnSync(command, {
			encoding: "utf8",
			stdio: "inherit",
		});

		return this;
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
			const s = spawnSync("echo", {
				input: `-e ${command.join("\n")} | tv`,
				encoding: "utf8",
				stdio: "inherit",
			});

			console.log(s);
			return outToString(
				spawnSync("echo", {
					input: `-e ${command.join("\n")} | tv`,
					encoding: "utf8",
					stdio: "inherit",
				}).stdout
			);
		} catch (e) {
			console.log(e);
			return "";
		}
		// try {
		// 	// const a = this.str(`echo "${command.join("\n").replace(/\$/g, "\\$")}" | tv`);
		// 	// execSync("tv", ["list-channels"]);
		// 	return this.spawn("echo", "-e", command.join("\n").replace(/\$/g, "\\$"), "| tv");
		// } catch (e) {
		// 	console.log(e);
		// 	return "";
		// }
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
	set(key, value) {
		checkDataFile();

		const data = JSON.parse(this.read(DATA_FILE));
		data[key] = value;

		this.writeTo(DATA_FILE, JSON.stringify(data));

		return this;
	},
	get(key, defaultVal) {
		checkDataFile();
		const result = JSON.parse(this.read(DATA_FILE))[key];

		if (result === undefined) {
			this.set(key, defaultVal);
			return defaultVal;
		}

		return result;
	},
};

export default cmd;

export function copy(text) {
	cmd.spawn("wl-copy", text); // must be done with "spawn"
}

export function paste() {
	if (cmd.json("hyprctl activewindow -j").class.endsWith("ghostty")) {
		// ctrl + shift + v
		cmd.spawn("ydotool", "key", "29:1", "42:1", "47:1", "47:0", "42:0", "29:0");
	} else {
		// ctrl + v
		cmd.spawn("ydotool", "key", "29:1", "47:1", "47:0", "29:0");
	}
}

export const KEYS = {
	lastWorkspace: "last-special-workspace",
	rofiDir: "rofi-dir",
	email: "rofi-email",
};
