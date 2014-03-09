for (var i = 0; i < 4; i += 1)
{
    with (global.g_MenuButtons[i])
        instance_destroy();
}

if (instance_exists(global.g_CategorySelectInstance))
    with (global.g_CategorySelectInstance)
        instance_destroy();
