-- Локация
tower_stage5 = room {
	nam = 'Башня';
	dsc = [[
		Ощущая зуд в ногах, ты преодолеваешь последний лестничный подъём
		и выходишь на этаж, отличающийся от предыдущих весьма скромной
		обстановкой.
	]];
	way = {
		'tower_stage5_room1';
		'tower_stage5_room2';
		'tower_stage5_room3';
		'tower_stage5_room4';
	};
	obj = {
		'tower_stage5_pictures';
		'tower_stage5_pictures_with_old_man';
		'tower_stage5_window';
	};
}

-- Переходы локации
tower_stage5_room1 = vroom('Дальняя левая дверь', 'tower_stage5_vicar_room');

tower_stage5_room2 = vroom('Ближняя левая дверь', 'tower_stage5_adviser_room');

tower_stage5_room3 = room {
	nam = 'Дальняя правая дверь';
	enter = function()
		return [[
			Ты осторожно открываешь дверь и заглядываешь внутрь.
			За дверью оказывается ещё один коридор, но на этот раз
			уже более просторный. В этом коридоре окно или
			любые другие источники света отсутствуют, поэтому
			тебе всё что тебе удаётся, это разглядеть ещё несколько дверей.
			Не желая шарить в потёмках, ты оставляешь коридор в покое.
		]], false
	end;
}

tower_stage5_room4 = room {
	nam = 'Ближняя правая дверь';
	enter = function()
		return [[
			Ты пытаешься открыть дверь, но ничего не выходит.
			Даже после того как ты пару раз толкаешь
			её плечом, дверь остаётся безнадёжно закрытой.
		]], false
	end;
}

-- Объекты локации
-- Портреты
tower_stage5_pictures = obj {
	nam = 'Портреты';
	dsc = [[
		Коридор содержит в себе четыре двери искуссно выполненных в дереве.
		Между дверьми висит несколько {портретов} в широких рамках.
	]];
	act = [[
		Ты мельком осматриваешь картины, с которых на тебя смотрят
		почтенные господа в дорогих одеждах.
	]];
}

-- Портреты с бывшим советником
tower_stage5_pictures_with_old_man = obj {
	nam = 'Портреты';
	dsc = tower_stage5_pictures.dsc;
	act = function()
		if tower_stage5_pictures.act ~= nil then
			return tower_stage5_pictures.act .. [[
				На одной из картин
				ты внезапно видишь странно знакомое лицо. Приглядевшись, ты
				узнаёшь в горделивых чертах портрета старика из
				подземелья, бывшего городского советника. Благородная осанка
				и строгий взгляд из-под кустистых бровей остались только
				на картие. В жизни же появились согнутая спина и новые морщины.
			]];
		end;

		return [[...]];
	end;
}
tower_stage5_pictures_with_old_man:disable();

-- Окно
tower_stage5_window = obj {
	nam = 'Окно';
	dsc = [[
		В конце коридора желтеет прямоугольник {окна}.
	]];
	act = [[
		Ты подходишь к окну и осторожно выглядываешь на улицу. Отсюда
		открывается вид на город ни чуть не хуже, чем из караульной.
		^
		Солнце уверенно клонится к закату. Ты осматриваешь город и
		быстро обнаруживаешь странное оживление на площади Режима.
		Пришлых торговцев, похоже, согнали оцепившие площадь солдаты.
		Множество рабочих возятся рядом с большими телегами, гружёнными
		досками. Группа плотников торопливо сколачивает на площади что-то
		очень сильно похожее на эшафот.
		^
		Ты отходишь от окна и судорожно чешешь загривок.
	]];
}

-- События локации
-- Узнаём старика на картине
on_event('recognize old man', function()
	tower_stage5_pictures_with_old_man:enable();
	tower_stage5_pictures:disable();
end)
