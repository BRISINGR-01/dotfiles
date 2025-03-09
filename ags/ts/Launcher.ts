const L = (monitor: number) =>
	Widget.Window({
		monitor,
		name: `bar${monitor}`,
		anchor: ["bottom"],
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