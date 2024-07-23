module idf.esp_event.esp_event_base;

@safe nothrow @nogc extern (C):

// dfmt off
enum ESP_EVENT_ANY_BASE = null; /// For registering a handler for any event base
enum ESP_EVENT_ANY_ID = -1;     /// For registering a handler for any event id
// dfmt on

// Unique pointer to a subsystem that exposes events
alias esp_event_base_t = const(char)*;

/// A number that identifies an event with respect to a base
alias esp_event_loop_handle_t = void*;

/// Function called when an event is posted to the queue
alias esp_event_handler_t = void function(
    void* event_handler_arg, esp_event_base_t event_base, int event_id, void* event_data,
);

/// Context identifying an instance of a registered event handler
alias esp_event_handler_instance_t = void*;

/// Implements the C macro of the same name
mixin template ESP_EVENT_DECLARE_BASE(string id)
{
extern (C):
    mixin(`extern __gshared esp_event_base_t ` ~ id ~ `;`);
}

/// Implements the C macro of the same name
mixin template ESP_EVENT_DEFINE_BASE(string id)
{
extern (C):
    mixin(`__gshared esp_event_base_t ` ~ id ~ ` = "` ~ id ~ `";`);
}
