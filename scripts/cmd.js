import chalk from "chalk";
import { execSync } from "child_process";
import path from "path";
import readline from "readline-sync";

function outToString(out) {
	return out.toString().replace(/\n$/, "").trim();
}

export default {
	run(command) {
		try {
			execSync(command);
		} catch (e) {
			console.log(e.stderr.toString());
			return false;
		}

		return true;
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
	dotfilesDir: path.resolve("/home", process.env.USER, "dotfiles"),
};
