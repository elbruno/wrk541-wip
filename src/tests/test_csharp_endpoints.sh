#!/bin/bash
# Test the C# Weather API endpoints
# This script is configured for the C# application running on port 5000

GREEN='\033[0;32m'
RED='\033[0;31m'
RESET='\033[0m' # No Color

# Configuration
PORT=${API_PORT:-5000}  # C# default port

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

echo "Testing C# Weather API on port ${PORT}..."
echo "========================================="

# Test the root endpoint (C# returns 301 permanent redirect)
test_endpoint "http://localhost:${PORT}/" 301 "root endpoint"

# Test the countries endpoint
test_endpoint "http://localhost:${PORT}/countries" 200 "countries endpoint"

# Test the monthly average endpoint for London in January
test_endpoint "http://localhost:${PORT}/countries/England/London/January" 200 "monthly average endpoint for London in January"

# Test error cases
test_endpoint "http://localhost:${PORT}/countries/InvalidCountry/City/January" 404 "invalid country"
test_endpoint "http://localhost:${PORT}/countries/England/InvalidCity/January" 404 "invalid city"
test_endpoint "http://localhost:${PORT}/countries/England/London/InvalidMonth" 404 "invalid month"

echo "========================================="
echo "Test suite completed!"
