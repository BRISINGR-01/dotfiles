const entry = App.configDir + "/ts/main.ts";
const outdir = App.configDir + "out";

try {
	await Utils.execAsync([
		"bun",
		"build",
		entry,
		"--outdir",
		outdir,
		"--external",
		"resource://*",
		"--external",
		"gi://*",
	]);
	await import(`file://${outdir}/main.js`);
} catch (error) {
	console.error(error);
}
