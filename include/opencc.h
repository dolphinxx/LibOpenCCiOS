const char* opencc_convert(const char* text, const char* configFile);

char** opencc_convertList(char** list, int size, const char* configFile);

void opencc_free_string(char *str);

void opencc_free_string_array(char **array, int size);

int opencc_dummy_method_to_enforce_bundling();