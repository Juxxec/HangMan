var buttonStrings;

buttonStrings[0] = "New Game";
buttonStrings[1] = "Achievements";
buttonStrings[2] = "Settings";
buttonStrings[3] = "Exit";

var height = (sprite_get_height(spr_blackboard) - 125);
var temp = (sprite_get_height(spr_button_image) + 50);

for (var i = 0; i < 4; i += 1)
{
    global.g_MenuButtons[i] = instance_create(global.g_FrameWidth / 2, 
            global.g_FrameHeight - height + (i * temp), obj_button);
    global.g_MenuButtons[i].m_Text = buttonStrings[i];
    global.g_MenuButtons[i].m_Font = fnt_button;
    global.g_MenuButtons[i].m_IconImage = spr_icons;
    global.g_MenuButtons[i].m_IconIndex = i;
    global.g_MenuButtons[i].m_Texture = spr_button_image;
}
