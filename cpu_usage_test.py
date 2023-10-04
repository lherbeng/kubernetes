import math
import time

# Define the duration (in seconds) for which you want to increase CPU usage
duration = 60  # Adjust this as needed

# Get the current time
start_time = time.time()

# Loop for the specified duration
while (time.time() - start_time) < duration:
    # Perform some CPU-intensive operation (e.g., calculate prime numbers)
    prime_numbers = []
    for num in range(2, 10 ** 5):
        if all(num % i != 0 for i in range(2, int(math.sqrt(num)) + 1)):
            prime_numbers.append(num)

# Once the loop finishes, the CPU usage will return to normal
