#!/bin/bash

az ad user create \
  --display-name "John Doe" \
  --password "ComplexPassword123!" \
  --user-principal-name "jdoe@example.com" \
  --mail-nickname "jdoe"
