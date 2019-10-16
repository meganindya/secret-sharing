# Secret Sharing
A MATLAB project based on a paper in Secret Sharing using Lin's approach.

### Objective
To encode a message image by producing n shares (keys) from it such that any r (< n) or more of those keys can generate back the original image.

### Process
##### Encoding
- Image is split into k parts each having width 1/k times the original image.
- One point (pixel intensity) is picked up from same relative positions of each of the k parts.
- A k-degree polynomial is generated using the k points as coefficients.
- The polynomial is evaluated for n values and each value (mod 251) is used as a pixel on respective shares at the corresponding position.

##### Decoding
- r keys are taken and and for each corresponding position operation.
- The r key numbers along with the corresponding point on it form r (x, y) pairs.
- The pairs are used to generate the original polynomial from which they were produced using Lagrange's Interpolation Polynomial approach.
- The k coefficients are then used to produce k parts for corresponding points of the resultant image.
- The image is stiched to get the original message image.

### Discussions
This process is however a lossy approach as a mod is taken w.r.t. 251. So pixels having intensities 251- 255 are lost. However, that usually corresponds to a very small number of pixels w.r.t the total number of pixels, and so negligible amount of information is only lost.
