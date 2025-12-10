#!/bin/bash
# Comparison test script to verify C# and Python API compatibility
# This script tests both implementations to ensure they return identical results

GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
RESET='\033[0m'

echo -e "${BLUE}==================================================${RESET}"
echo -e "${BLUE}API Compatibility Test: Python vs C#${RESET}"
echo -e "${BLUE}==================================================${RESET}"

# Configuration
PYTHON_PORT=8000
CSHARP_PORT=5000

echo ""
echo "Testing endpoints on both implementations..."
echo ""

# Test countries endpoint
echo -e "${BLUE}Testing /countries endpoint...${RESET}"
PYTHON_COUNTRIES=$(curl -s http://localhost:${PYTHON_PORT}/countries | python3 -c "import sys, json; print(sorted(json.load(sys.stdin)))")
CSHARP_COUNTRIES=$(curl -s http://localhost:${CSHARP_PORT}/countries | python3 -c "import sys, json; print(sorted(json.load(sys.stdin)))")

if [ "$PYTHON_COUNTRIES" == "$CSHARP_COUNTRIES" ]; then
    echo -e "  ${GREEN}✓${RESET} /countries responses match"
else
    echo -e "  ${RED}✗${RESET} /countries responses differ"
    echo "    Python: $PYTHON_COUNTRIES"
    echo "    C#: $CSHARP_COUNTRIES"
fi

# Test specific weather endpoint
echo -e "${BLUE}Testing /countries/England/London/January endpoint...${RESET}"
PYTHON_WEATHER=$(curl -s http://localhost:${PYTHON_PORT}/countries/England/London/January | python3 -c "import sys, json; d=json.load(sys.stdin); print(f\"high:{d['high']},low:{d['low']}\")")
CSHARP_WEATHER=$(curl -s http://localhost:${CSHARP_PORT}/countries/England/London/January | python3 -c "import sys, json; d=json.load(sys.stdin); print(f\"high:{d['high']},low:{d['low']}\")")

if [ "$PYTHON_WEATHER" == "$CSHARP_WEATHER" ]; then
    echo -e "  ${GREEN}✓${RESET} Weather data responses match"
else
    echo -e "  ${RED}✗${RESET} Weather data responses differ"
    echo "    Python: $PYTHON_WEATHER"
    echo "    C#: $CSHARP_WEATHER"
fi

# Test error handling (404)
echo -e "${BLUE}Testing error handling (invalid country)...${RESET}"
PYTHON_ERROR=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:${PYTHON_PORT}/countries/InvalidCountry/City/Month)
CSHARP_ERROR=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:${CSHARP_PORT}/countries/InvalidCountry/City/Month)

if [ "$PYTHON_ERROR" == "$CSHARP_ERROR" ]; then
    echo -e "  ${GREEN}✓${RESET} Error responses match (both return ${PYTHON_ERROR})"
else
    echo -e "  ${RED}✗${RESET} Error responses differ"
    echo "    Python: $PYTHON_ERROR"
    echo "    C#: $CSHARP_ERROR"
fi

echo ""
echo -e "${BLUE}==================================================${RESET}"
echo -e "${BLUE}API Compatibility Test Complete${RESET}"
echo -e "${BLUE}==================================================${RESET}"
