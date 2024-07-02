#!/bin/bash

# data_processor.sh

# Check if file exists
if [ ! -f "data.csv" ]; then
    echo "Error: data.csv not found!"
    exit 1
fi

# Count total entries
total_entries=$(wc -l < data.csv)
echo "Total entries: $((total_entries - 1))"  # Subtract 1 for header

# Calculate total revenue
total_revenue=$(cut -d',' -f6 data.csv | tail -n +2 | paste -sd+ | bc)
echo "Total revenue: $total_revenue"

# Find most expensive product
most_expensive=$(sort -t',' -k5 -nr data.csv | head -n 2 | tail -n 1 | cut -d',' -f2,5)
echo "Most expensive product: $most_expensive"

# Count sales by category
echo "Sales by category:"
cut -d',' -f3 data.csv | tail -n +2 | sort | uniq -c
