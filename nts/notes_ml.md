<details open><summary style="font-size:22px;color:Orange">Machine Learning Terms and Concepts</summary>

1. **Supervised Learning**: Supervised learning is a type of machine learning where the model learns from labeled data, meaning each input data point is associated with an output label. The goal is to learn a mapping from inputs to outputs based on the provided examples. Common supervised learning tasks include classification (predicting a category) and regression (predicting a continuous value).

2. **Unsupervised Learning**: Unsupervised learning is a type of machine learning where the model learns from unlabeled data, meaning there are no output labels provided. The goal is to discover patterns, structures, or relationships in the data without explicit guidance. Common unsupervised learning tasks include clustering (grouping similar data points) and dimensionality reduction (reducing the number of input features).

3. **Reinforcement Learning**: Reinforcement learning is a type of machine learning where an agent learns to interact with an environment by taking actions to maximize cumulative rewards. The agent learns through trial and error, receiving feedback from the environment in the form of rewards or penalties. The goal is to learn a policy that maps states to actions in order to achieve long-term objectives.

4. **Model**: A model is a mathematical representation of a system or process that captures the relationships between inputs and outputs. In machine learning, a model learns from data to make predictions or decisions. Examples of models include linear regression, decision trees, neural networks, etc.

5. **Feature**: A feature is an individual measurable property or characteristic of a data point. Features are the input variables used to train a machine learning model. They can be numeric, categorical, or even text-based. Feature engineering involves selecting, transforming, and creating relevant features to improve model performance.

6. **Label**: A label is the output or target variable in supervised learning. It represents the ground truth or correct answer associated with each input data point. In classification tasks, labels are categorical (e.g., class labels), while in regression tasks, labels are continuous (e.g., numerical values).

7. **Training Data**: Training data is the labeled data used to train a machine learning model. It consists of input features and corresponding labels. The model learns from the training data to generalize patterns and relationships that enable it to make predictions on new, unseen data.

8. **Testing Data**: Testing data is separate from the training data and is used to evaluate the performance of a trained machine learning model. It consists of input features and corresponding labels, but the model has not seen the testing data during training. Testing data helps assess the model's ability to generalize to new, unseen examples.

9. **Overfitting**: Overfitting occurs when a machine learning model learns to capture noise or random fluctuations in the training data rather than underlying patterns. As a result, the model performs well on the training data but poorly on unseen data. Overfitting can be mitigated by using techniques such as cross-validation, regularization, and reducing model complexity.

10. **Underfitting**: Underfitting occurs when a machine learning model is too simple to capture the underlying structure of the data. The model fails to learn from the training data and performs poorly on both the training and testing data. Underfitting can be addressed by using more complex models, adding more features, or increasing the model's capacity.

11. **Bias-Variance Tradeoff**: The bias-variance tradeoff is a fundamental concept in machine learning that refers to the balance between bias (error due to underfitting) and variance (error due to overfitting). A model with high bias tends to oversimplify the data, while a model with high variance captures noise in the data. Finding the right balance between bias and variance is essential for building models that generalize well to new data.

12. **Cross-Validation**: Cross-validation is a technique used to assess the performance of a machine learning model. It involves partitioning the training data into multiple subsets, training the model on different combinations of subsets, and evaluating its performance on the remaining data. Cross-validation helps estimate the model's generalization error and identify potential issues such as overfitting.

13. **Hyperparameters**: Hyperparameters are configuration settings that are not learned from the data but are set before training a machine learning model. Examples of hyperparameters include learning rate, regularization strength, and the number of hidden layers in a neural network. Tuning hyperparameters is an essential step in optimizing model performance.

14. **Gradient Descent**: Gradient descent is an optimization algorithm used to minimize the loss function and update the parameters of a machine learning model. It works by iteratively adjusting the model parameters in the direction of the steepest descent of the loss function gradient. Gradient descent is widely used in training neural networks and other iterative optimization problems.

15. **Loss Function**: A loss function measures the difference between the predicted values of a machine learning model and the actual values (labels) in the training data. The goal is to minimize the loss function during training, which indicates how well the model is performing. Common loss functions include mean squared error (MSE) for regression tasks and cross-entropy loss for classification tasks.

16. **Regularization**: Regularization is a technique used to prevent overfitting by adding a penalty term to the loss function. It discourages the model from learning overly complex patterns

</details>

---

<details open><summary style="font-size:22px;color:Orange">Linear Regression</summary>

</details>

---

<details open><summary style="font-size:22px;color:Orange">Logistic Regression</summary>

</details>

---

<details open><summary style="font-size:22px;color:Orange">Support Vector Machine (SVM)</summary>

Support Vector Machine (SVM) is a supervised machine learning algorithm used for classification and regression tasks. It is particularly effective in high-dimensional spaces and is widely used for tasks such as image classification, text classification, and regression analysis. Here's a detailed explanation of Support Vector Machines:

1. **Introduction**:

    - SVM was developed by Vladimir Vapnik and his colleagues in the 1990s.
    - It falls under the category of discriminative classifiers.

2. **Objective**:

    - The primary objective of SVM is to find a hyperplane that best separates data into different classes in feature space.

3. **Key Concepts**:

    - `Hyperplane`:
        - In a two-dimensional space, a hyperplane is a line that separates the data into different classes.
        - In higher-dimensional spaces, it becomes a plane.
    - `Support Vectors`:
        - Support vectors are the data points that are closest to the decision boundary (hyperplane).
        - They play a crucial role in determining the optimal hyperplane.
    - `Margin`:
        - The margin is the distance between the decision boundary and the nearest data point (support vector).
        - SVM aims to maximize this margin.
    - `Kernel Trick`:
        - SVM can efficiently handle non-linearly separable data by using the kernel trick.
        - Common kernels include linear, polynomial, and radial basis function (RBF) kernels.

4. **Classification**:

    - `Linear SVM`:

        - For linearly separable data, SVM finds the optimal hyperplane that maximizes the margin.
        - The decision function is based on the sign of the dot product between the input vector and the weight vector.

    - `Soft Margin SVM`:

        - In cases where data is not perfectly separable, SVM introduces a penalty term (C) to allow for some misclassification.

    - `Multi-Class Classification`:
        - SVM can be extended for multi-class classification using methods like one-vs-one or one-vs-all.

5. **Regression**:

    SVM can be used for regression tasks by predicting a continuous output instead of discrete classes.

6. **Optimization**:

    - The optimization problem involves finding the weights and bias that define the hyperplane.
    - The objective is to maximize the margin while minimizing the classification error.

7. **Regularization (C parameter)**:

    - The regularization parameter (C) controls the trade-off between maximizing the margin and minimizing the classification error.
    - Larger values of C result in a smaller margin but fewer misclassifications.

8. **Kernel Functions: Commonly used kernels include**:

    - Linear Kernel
    - Polynomial Kernel
    - RBF (Radial Basis Function) Kernel

9. **Advantages**:

    - Effective in high-dimensional spaces.
    - Versatile and can handle non-linear data.

10. **Challenges**:

    - Choice of kernel and hyperparameter tuning can be critical.
    - Sensitivity to outliers.

11. **Applications**:

    - Text classification, image classification, handwriting recognition, face detection, etc.

12. **Summary**:

    - SVM aims to find a hyperplane that best separates data into different classes with a maximum margin.
    - It can handle non-linearly separable data using the kernel trick.
    - The regularization parameter (C) controls the trade-off between margin maximization and classification error minimization.

</details>

---

<details open><summary style="font-size:22px;color:Orange">Decission Tree</summary>

</details>

---

<details open><summary style="font-size:22px;color:Orange">Random Forest</summary>

</details>

---

<details open><summary style="font-size:22px;color:Orange">Support Vector Machine (SVM)</summary>

</details>

---

### Generative AI

Generative AI, short for Generative Artificial Intelligence, refers to a category of artificial intelligence systems and techniques that are designed to generate new, original content or data that is similar to, or resembles, human-created content. These systems have the ability to produce text, images, audio, or even other types of data, often based on patterns and structures they have learned from large datasets during training.

Here are some key aspects and concepts related to generative AI:

-   `Generative Models`: Generative AI systems are often built using generative models, which are mathematical and computational models that learn the underlying patterns and structures of data. These models can then generate new instances of data that share similarities with the training data.

-   `Training Data`: Generative AI models require large datasets for training. For example, a text-based generative model might be trained on a vast collection of text documents, while an image-based model would need a large dataset of images. The quality and diversity of the training data can significantly impact the generated results.

-   `Variety of Applications`: Generative AI has a wide range of applications across various domains. Some common applications include:

    -   `Text Generation`: This includes tasks such as language translation, chatbots, and the generation of creative writing or poetry.

    -   `Image Generation`: Generative models can create realistic images, whether it's generating faces of people who don't exist, enhancing or modifying existing images, or creating entirely new artworks.

    -   `Audio Generation`: In the realm of audio, generative AI can create music, mimic human speech, or even generate sound effects for games and movies.

-   `Types of Generative Models`: There are several types of generative models, with some of the most notable being:

    -   `Generative Adversarial Networks (GANs)`: GANs consist of two neural networks, a generator and a discriminator, that are trained in opposition. The generator aims to create data that is indistinguishable from real data, while the discriminator tries to tell the difference. This adversarial training process leads to the generation of high-quality content.

    -   `Variational Autoencoders (VAEs)`: VAEs are probabilistic models that map data into a lower-dimensional space and then back to the original space. They are used for tasks like image reconstruction and generating new data samples.

    -   `Recurrent Neural Networks (RNNs) and Transformers`: These models are often used for text generation tasks. Transformers, in particular, have become popular due to their effectiveness in various natural language processing applications.

-   `Ethical Considerations`: Generative AI also raises ethical concerns, especially when it comes to generating deepfake videos or misinformation. It's important to use this technology responsibly and consider the potential consequences.

In summary, generative AI is a fascinating field that revolves around the creation of AI systems capable of producing new and creative content across different domains. These systems are increasingly finding applications in industries such as entertainment, healthcare, and marketing, among others, and they continue to advance with ongoing research and development efforts.

---

**Equation 4-1: Linear Regression model prediction**

$$
\hat{y} = \theta_0 + \theta_1 x_1 + \theta_2 x_2 + \dots + \theta_n x_n
$$

**Equation 4-2: Linear Regression model prediction (vectorized form)**

$$
\hat{y} = h_{\boldsymbol{\theta}}(\mathbf{x}) = \boldsymbol{\theta} \cdot \mathbf{x}
$$

**Equation 4-3: MSE cost function for a Linear Regression model**

$$
\begin{split}
\text{MSE}(\mathbf{X}, h*{\boldsymbol{\theta}})
&= \dfrac{1}{m} \sum\limits*{i=1}^{m}{(\boldsymbol{\theta}^T \mathbf{x}^{(i)} - y^{(i)})^2} \\
&= \dfrac{1}{m} \left\| \mathbf{X} \boldsymbol{\theta} - \mathbf{y}) \right\|^2
\end{split}
$$

**Equation 4-4: Normal Equation**

$$
\hat{\boldsymbol{\theta}} = (\mathbf{X}^T \mathbf{X})^{-1} \mathbf{X}^T \mathbf{y}
$$

**Equation 4-5: Partial derivatives of the cost function**

$$
\dfrac{\partial}{\partial \theta_j} \text{MSE}(\boldsymbol{\theta}) = \dfrac{2}{m}\sum\limits_{i=1}^{m}(\boldsymbol{\theta}^T \mathbf{x}^{(i)} - y^{(i)})\, x_j^{(i)}
$$

**Equation 4-6: Gradient vector of the cost function**

$$
\nabla_{\boldsymbol{\theta}}\, \text{MSE}(\boldsymbol{\theta}) =
\begin{pmatrix}
 \frac{\partial}{\partial \theta_0} \text{MSE}(\boldsymbol{\theta}) \\
 \frac{\partial}{\partial \theta_1} \text{MSE}(\boldsymbol{\theta}) \\
 \vdots \\
 \frac{\partial}{\partial \theta_n} \text{MSE}(\boldsymbol{\theta})
\end{pmatrix}
 = \dfrac{2}{m} \mathbf{X}^T (\mathbf{X} \boldsymbol{\theta} - \mathbf{y})
$$

**Equation 4-7: Gradient Descent step**

$$
\boldsymbol{\theta}_{new} = \boldsymbol{\theta}_{old} - \eta \cdot \nabla_{\boldsymbol{\theta}}\, \text{MSE}(\boldsymbol{\theta})
$$

**Equation 4-8: Ridge Regression cost function**

$$
\begin{split}
J(\boldsymbol{\theta})
&= \dfrac{1}{m} \sum\limits*{i=1}^{m}{(\boldsymbol{\theta}^T \mathbf{x}^{(i)} - y^{(i)})^2} + \alpha \dfrac{1}{2}\sum\limits*{i=1}^{n}{\theta*i}^2 \\
&= \dfrac{1}{m} \left\| \mathbf{X} \boldsymbol{\theta} - \mathbf{y}) \right\|^2 + \dfrac{\alpha}{2}\sum\limits*{i=1}^{n} \left\| \boldsymbol{\theta} \right\|^2
\end{split}
$$

**Equation 4-9: Ridge Regression closed-form solution**

$$
\hat{\boldsymbol{\theta}} = (\mathbf{X}^T \mathbf{X} + \alpha \mathbf{I})^{-1} \mathbf{X}^T \mathbf{y}
$$

**Equation 4-10: Lasso Regression cost function**

$$
\begin{split}
J(\boldsymbol{\theta})
&= \dfrac{1}{m} \sum\limits*{i=1}^{m}{(\boldsymbol{\theta}^T \mathbf{x}^{(i)} - y^{(i)})^2} + \alpha \sum\limits*{i=1}^{n}\left| \theta*i \right| \\
&= \dfrac{1}{m} \left\| \mathbf{X} \boldsymbol{\theta} - \mathbf{y}) \right\|^2 + \alpha \sum\limits*{i=1}^{n} {\left\| \boldsymbol{\theta} \right\|}\_{1}
\end{split}
$$

**Equation 4-11: Lasso Regression subgradient vector**

$$
g(\boldsymbol{\theta}, J) = \nabla_{\boldsymbol{\theta}}\, \text{MSE}(\boldsymbol{\theta}) + \alpha
\begin{pmatrix}
  \operatorname{sign}(\theta_1) \\
  \operatorname{sign}(\theta_2) \\
  \vdots \\
  \operatorname{sign}(\theta_n) \\
\end{pmatrix} \quad \text{where } \operatorname{sign}(\theta_i) =
\begin{cases}
-1 & \text{if } \theta_i < 0 \\
0 & \text{if } \theta_i = 0 \\
+1 & \text{if } \theta_i > 0
\end{cases}
$$
