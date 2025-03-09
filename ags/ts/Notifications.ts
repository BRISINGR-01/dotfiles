import Notification from "./Notification";
const resource = (file) => `resource:///com/github/Aylur/ags/${file}.js`;
const require = async (file) => (await import(resource(file))).default;
const service = async (file) => await require(`service/${file}`);
const Notifications = await service("notifications");

const Popups = () => {
	const map = new Map();

	const onDismissed = (box, id, force = false) => {
		if (!id || !map.has(id)) return;

		if (map.get(id)._hovered.value && !force) return;

		if (map.size - 1 === 0) box.get_parent().revealChild = false;

		Utils.timeout(200, () => {
			map.get(id)?.destroy();
			map.delete(id);
		});
	};

	const onNotified = (box, id) => {
		if (!id || Notifications.dnd) return;

		map.delete(id);
		map.set(id, Notification(Notifications.getNotification(id)));
		box.children = Array.from(map.values()).reverse();
		Utils.timeout(10, () => {
			box.get_parent().revealChild = true;
		});
	};

	return Widget.Box({
		vertical: true,
		connections: [
			[Notifications, onNotified, "notified"],
			[Notifications, onDismissed, "dismissed"],
			[Notifications, (box, id) => onDismissed(box, id, true), "closed"],
		],
	});
};

const PopupList = () =>
	Widget.Box({
		class_name: "notifications-popup-list",
		css: "padding: 1px",
		children: [
			Widget.Revealer({
				transition: "slide_down",
				child: Popups(),
			}),
		],
	});

export default (monitor) =>
	Widget.Window({
		monitor,
		layer: "overlay",
		name: `notifications${monitor}`,
		anchor: ["top", "right"],
		child: PopupList(),
	});
