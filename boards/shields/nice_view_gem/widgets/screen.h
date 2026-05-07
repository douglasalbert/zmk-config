#pragma once

#include <lvgl.h>
#include <zephyr/kernel.h>
#include "util.h"

#define SCREEN_BUF_SIZE (SCREEN_WIDTH * SCREEN_HEIGHT) /* L8: 1 byte/pixel */

struct zmk_widget_screen {
    sys_snode_t node;
    lv_obj_t *obj;
    uint8_t cbuf[SCREEN_BUF_SIZE];
    struct status_state state;
};

int zmk_widget_screen_init(struct zmk_widget_screen *widget, lv_obj_t *parent);
lv_obj_t *zmk_widget_screen_obj(struct zmk_widget_screen *widget);
