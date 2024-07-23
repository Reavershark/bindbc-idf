module idf.freertos;

public import idf.freertos.idf_freertos_c_code;

@safe nothrow @nogc extern (C):

enum portMAX_DELAY = TickType_t.max;

EventBits_t xEventGroupSetBits(EventGroupHandle_t xEventGroup, const EventBits_t uxBitsToSet);
