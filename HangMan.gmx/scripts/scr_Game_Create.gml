// Add the hangman animation
global.g_HangmanInstance = instance_create(global.g_FrameWidth / 2,
                    (global.g_FrameHeight - sprite_get_height(spr_blackboard) + 50), 
                    obj_hangman);
                    
global.g_WordInstance = instance_create(global.g_FrameWidth / 2,
                    global.g_HangmanInstance.y + 75 + sprite_get_height(spr_hangman), obj_word);
                    
// Create the letters                 
draw_set_font(fnt_letter);
global.g_Alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
m_LetterSize = max(string_width("A"), string_height("A"));
m_LetterPerRow = 6;
m_SeparationX = 10;
m_SeparationY = 6;
var dx = 0, dy = 0;
var height = ceil(string_length(global.g_Alphabet) / m_LetterPerRow) * (m_LetterSize + m_SeparationY * 2);

var xx = ((global.g_FrameWidth / 2) - (m_LetterPerRow / 2 * m_LetterSize)
    - (m_LetterPerRow / 2 - 2) * m_SeparationX * 2 - 15);
var yy = (global.g_FrameHeight - 75 - height);

// For every letter in the alphabet
for (i = 1; i <= string_length(global.g_Alphabet); i++)
{
    // Get the current letter
    var letter = string_char_at(global.g_Alphabet, i);
   
    // 5 letters per row
    if ((i - 1) mod m_LetterPerRow  == 0)
        dy += (m_LetterSize + 2 * m_SeparationY);
    dx  = ((i - 1) mod m_LetterPerRow ) * (m_LetterSize + 2 * m_SeparationX);
    
    // Create the letters
    global.g_Letters[i]             = instance_create(xx + dx, yy + dy, obj_letter);
    global.g_Letters[i].m_Letter    = letter;
    global.g_Letters[i].m_Id        = 2000 + i;
    global.g_Letters[i].m_Highlight = spr_letter_highlight;
    global.g_Letters[i].m_Size      = m_LetterSize;
    global.g_Letters[i].m_Font      = fnt_letter;
}
