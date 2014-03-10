for (var i = 1; i <= string_length(global.g_Alphabet); i++)
    if (instance_exists(global.g_Letters[i]))
        with (global.g_Letters[i]) { instance_destroy(); }

with (global.g_HangmanInstance) { instance_destroy(); }
with (global.g_WordInstance) { instance_destroy(); }

if (instance_exists(global.g_NewGame))
    with (global.g_NewGame)
            instance_destroy();

if (instance_exists(obj_result))
    with (obj_result)
        instance_destroy();
