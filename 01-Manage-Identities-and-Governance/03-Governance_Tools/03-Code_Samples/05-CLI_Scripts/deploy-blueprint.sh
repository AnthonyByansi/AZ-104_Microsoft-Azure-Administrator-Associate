#!/bin/bash
az blueprint create \
    --name "ITStandardBlueprint" \
    --description "Standard blueprint for IT resources" \
    --location "eastus" \
    --blueprint-folder "/path/to/blueprint/folder"
