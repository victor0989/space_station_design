import numpy as np
import matplotlib.pyplot as plt

# Time simulation in years (from now until the galactic collision)
time_years = np.linspace(0, 4e9, 1000)  # 4 billion years

# Simulated temperature (K) - assuming exponential increase
initial_temp = 300  # Initial temperature in K
final_temp = 1e4  # Expected final temperature in K
temperature = initial_temp * np.exp(time_years / time_years[-1])

# Simulated radiation (W/m^2) - exponential increase
initial_radiation = 1370  # Current solar radiation in W/m^2
final_radiation = 1e6  # Expected radiation in W/m^2
radiation = initial_radiation * np.exp(time_years / time_years[-1])

# Plotting the results
plt.figure(figsize=(12, 6))

# Temperature plot
plt.subplot(1, 2, 1)
plt.plot(time_years / 1e9, temperature, label='Temperature (K)')
plt.xlabel('Time (billion years)')
plt.ylabel('Temperature (K)')
plt.title('Temperature Increase Over Time')
plt.legend()

# Radiation plot
plt.subplot(1, 2, 2)
plt.plot(time_years / 1e9, radiation, label='Radiation (W/m^2)', color='orange')
plt.xlabel('Time (billion years)')
plt.ylabel('Radiation (W/m^2)')
plt.title('Radiation Increase Over Time')
plt.legend()

plt.tight_layout()
plt.show()
