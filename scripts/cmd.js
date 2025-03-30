import chalk from "chalk";
import { execSync, spawn } from "child_process";
import path from "path";
import readline from "readline-sync";

function outToString(out) {
	return out.toString().replace(/\n$/, "").trim();
}

export default {
	params: process.argv.slice(2),
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
			const [cmd, ...args] = command.split(" ");
			const process = spawn(cmd, args, {
				detached: true, // Runs independently
				stdio: "ignore", // Prevents Node from waiting for output
			});

			process.unref();
			return true;
		} catch (e) {
			return false;
		}
	},
	num(command) {
		return parseInt(execSync(command));
	},
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
	dotfilesDir: path.resolve("/home", process.env.USER, "dotfiles"),
};
