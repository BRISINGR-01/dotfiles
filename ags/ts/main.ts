import Notifications from "./Notifications";

const time = Variable("", {
	poll: [
		1000,
		function () {
			return Date().toString();
		},
	],
});

const Bar = (monitor: number) =>
	Widget.Window({
		monitor,
		name: `bar${monitor}`,
		anchor: ["top", "left", "right"],
		exclusivity: "exclusive",
		child: Widget.CenterBox({
			start_widget: Widget.Label({
				hpack: "center",
				label: "Welcome!",
			}),
			end_widget: Widget.Label({
				hpack: "center",
				label: time.bind(),
			}),
		}),
	});

App.config({
	windows: [Notifications(0)],
	cacheNotificationActions: true,
	maxStreamVolume: 1.5,
	closeWindowDelay: {
		quicksettings: 300,
		dashboard: 300,
	},
	style: "/home/alex/a/style.css",
	notificationPopupTimeout: 5000, // milliseconds
});
