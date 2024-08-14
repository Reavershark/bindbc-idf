module idf.freertos;

public import idf.freertos.idf_freertos_c_code;

@safe nothrow @nogc extern (C):

alias BaseType_t = int;
alias UBaseType_t = uint;

enum BaseType_t pdFALSE = 0;
enum BaseType_t pdTRUE = 1;
enum pdPASS = pdTRUE;
enum pdFAIL = pdFALSE;

enum portMAX_DELAY = TickType_t.max;

enum BaseType_t tskNO_AFFINITY = 0x7FFFFFFF;

BaseType_t xTaskCreatePinnedToCore(
    TaskFunction_t pvTaskCode,
    const char* pcName,
    const uint usStackDepth,
    void* pvParameters,
    UBaseType_t uxPriority,
    TaskHandle_t* pvCreatedTask,
    const BaseType_t xCoreID = tskNO_AFFINITY,
);

alias xTaskCreate = xTaskCreatePinnedToCore;

void vTaskDelay(const TickType_t xTicksToDelay);

void vTaskSuspend(TaskHandle_t xTaskToSuspend);

/// Actions that can be performed when vTaskNotify() is called.
// dfmt off
enum eNotifyAction
{
    eNoAction = 0,             /// Notify the task without updating its notify value.
    eSetBits,                  /// Set bits in the task's notification value.
    eIncrement,                /// Increment the task's notification value.
    eSetValueWithOverwrite,    /// Set the task's notification value to a specific value even if the previous value has not yet been read by the task.
    eSetValueWithoutOverwrite, /// Set the task's notification value if the previous value has been read by the task.
}
// dfmt on

BaseType_t xTaskGenericNotifyFromISR(
    TaskHandle_t xTaskToNotify,
    UBaseType_t uxIndexToNotify,
    uint ulValue,
    eNotifyAction eAction,
    uint* pulPreviousNotificationValue,
    BaseType_t* pxHigherPriorityTaskWoken
);

uint ulTaskGenericNotifyTake(
    UBaseType_t uxIndexToWaitOn,
    BaseType_t xClearCountOnExit,
    TickType_t xTicksToWait,
);

EventBits_t xEventGroupSetBits(EventGroupHandle_t xEventGroup, const EventBits_t uxBitsToSet);
