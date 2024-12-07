#!/bin/bash

az ad user invite \
  --user-principal-name "guestuser@example.com" \
  --display-name "Guest User" \
  --invited-redirect-url "https://portal.azure.com"
