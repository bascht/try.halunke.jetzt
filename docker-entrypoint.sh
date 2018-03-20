#!/bin/bash

rake assets:precompile
exec rails server -b 0.0.0.0
