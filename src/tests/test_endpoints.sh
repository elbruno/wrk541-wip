#!/bin/bash
# Test the API endpoints
# 
# By default, this script tests against port 8000 (Python FastAPI default).
# For C# application, either run with: dotnet run --urls "http://localhost:8000"
# Or update the PORT variable below to 5000 (C# default port).

GREEN='\033[0;32m'
RED='\033[0;31m'
RESET='\033[0m' # No Color

# Configuration
PORT=${API_PORT:-8000}  # Default to 8000, override with environment variable: API_PORT=5000 ./test_endpoints.sh

test_endpoint() {
    local url=$1
    local expected_status=$2
    local description=$3

    printf "[TEST] %-50s" "${description}"
    actual_status=$(curl -o /dev/null -s -w "%{http_code}" ${url})
    if [ "${actual_status}" -eq "${expected_status}" ]; then
        printf "${GREEN}[PASS]${RESET}\n"
    else
        printf "${RED}[FAIL]${RESET}\n\t- Expected: ${expected_status}, Got: ${actual_status}\n"
    fi
}

# Test the root endpoint (both Python and C# return 301)
test_endpoint "http://localhost:${PORT}/" 301 "root endpoint"

# Test the countries endpoint
test_endpoint "http://localhost:${PORT}/countries" 200 "countries endpoint"

# Test the monthly average endpoint for London in January
test_endpoint "http://localhost:${PORT}/countries/England/London/January" 200 "monthly average endpoint for London in January"
