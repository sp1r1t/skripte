#!/bin/bash

sh -c 'xsel | xvkbd -xsendevent -file - 2>/dev/null'
