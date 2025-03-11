import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# Set random seed for reproducibility
np.random.seed(42)

# Define parameters for the distributions
mu_x, sigma_x = 100, 20  # Mean and standard deviation for X
mu_y1, sigma_y1 = 80, 20  # First group (diastolic BP)
mu_y2, sigma_y2 = 120, 20  # Second group

# Generate a sample using transformed standard normal variables for Unimodal Distribution
sample1 = []
for _ in range(200):
    z_x = np.random.normal(0, 1)
    x = mu_x + sigma_x * z_x
    sample1.append(x)

# Generate a multimodal sample using two transformed normal distributions
sample2 = []
for _ in range(100):  # First normal distribution (Mean 80, SD 20)
    z_y = np.random.normal(0, 1)
    y1 = mu_y1 + sigma_y1 * z_y
    sample2.append(y1)

for _ in range(100):  # Second normal distribution (Mean 120, SD 20)
    z_y = np.random.normal(0, 1)
    y2 = mu_y2 + sigma_y2 * z_y
    sample2.append(y2)

# Convert lists to NumPy arrays
sample1 = np.array(sample1)
sample2 = np.array(sample2)

# Plot density curves
plt.figure(figsize=(10, 6))
sns.kdeplot(sample1, label="Unimodal Distribution (Transformed Standard Normal)", color='blue', linewidth=2)
sns.kdeplot(sample2, label="Multimodal Distribution (Mixture of Two Transformed Normals)", color='red', linewidth=2)

# Show histogram for better visualization
sns.histplot(sample1, kde=True, bins=20, color='blue', alpha=0.3, stat="density")
sns.histplot(sample2, kde=True, bins=20, color='red', alpha=0.3, stat="density")

# Labels and legend
plt.title("Density Curves: Unimodal vs Multimodal Distributions (Transformed Normal Variables)", fontsize=14)
plt.xlabel("Value", fontsize=12)
plt.ylabel("Density", fontsize=12)
plt.legend()
plt.grid(True)
plt.show()
