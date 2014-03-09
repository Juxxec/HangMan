var cat, diff, word;

// From what category should the words be loaded
cat = argument0;
// Difficulty of the word
diff = argument1;
// The retrieved word
word = "";

var openCatTag = false;
var openDiffTag = false;
var catFound = false;
var diffFound = false;
var category = "";
var difficulty = 0;
var count = 0;

global.g_wordFileHandle = file_text_open_read(global.g_wordFilePath)
if (global.g_wordFileHandle == -1)
{
    return -6;
}

while (!file_text_eof(global.g_wordFileHandle))
{
    var line = file_text_read_string(global.g_wordFileHandle);
    
    if (string_count("<category name=", line) == 1 )
    {
        if (openCatTag == false)
        {
            openCatTag = true;
            
            // Get the category name
            line = string_delete(line, 1, string_pos('"', line));
            category = string_copy(line, 1, string_pos('">', line) - 1);
            
            
            // Check if we are in the right category
            if (category == cat)
            {
                catFound = true;
            }
            
            
        }
        else
        {
            return -1;
        }
    }
    
    if (string_count("</category>", line) == 1)
    {
        if (openDiffTag == false)
            openCatTag = false;
        else
            return -2;
    }
    
    if (string_count("</difficulty>", line) == 1)
    {
        if (openCatTag == true)
            openDiffTag = false;
        else
            return -3;
    }
    
    if (string_count("<difficulty value=", line) == 1)
    {
        if (openCatTag == true)
        {
            openDiffTag = true;
            
            // Get the difficulty
            line = string_delete(line, 1, string_pos("value=", line) + 5);
            difficulty = real(string_copy(line, 1, string_pos(" ", line) - 1));
            line = string_delete(line, 1, string_pos("count=", line) + 5);
            count = real(string_copy(line, 1, string_pos(">", line) - 1));
            
            // Check if we are in the right difficulty section
            if (difficulty == diff)
            {
                diffFound = true;
                file_text_readln(global.g_wordFileHandle);
                continue;
            }
        }
    }
    
    if (diffFound && catFound)
    {
        var index = floor(random(count));
        // Choose a random word
        for (var j = 0; j < index; j ++)
        {
            file_text_readln(global.g_wordFileHandle);
            line = file_text_read_string(global.g_wordFileHandle);
            if (file_text_eof(global.g_wordFileHandle))
                return -4;
        }
        
        // Get the word
        line = string_delete(line, 1, string_pos("value=", line) + 6);
        word = string_copy(line, 1, string_pos('">', line) - 1);
        
        return word;
    }
    
    file_text_readln(global.g_wordFileHandle);
}

file_text_close(global.g_wordFileHandle);

return -5;
