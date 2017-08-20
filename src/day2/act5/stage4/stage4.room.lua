tower_stage4_to_stage2 = vroom('Лестница', 'tower_stage2')
tower_stage4_to_stage5 = vroom('Лестница', 'tower_stage5')
tower_stage4_to_stage5:disable()

tower_stage4 = room {
	nam = 'Четвёртный этаж';
	dsc = [[
		Лестница с выходом в Караульную. Так же на этаже есть лестница на второй или пятый этаж. Рядом с ней на стене странные символы.
	]];
	way = {
		'tower_stage4_sentry';
		tower_stage4_to_stage2;
		tower_stage4_to_stage5;
	};
}

on_event('learned stairway symbols', function()
	tower_stage4_to_stage5:enable()
	tower_stage4_to_stage2:disable()
end)

