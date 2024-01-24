# nps-teleamp
Package containing codes in MATLAB and Mathematica for S.U. Shringarpure, Y.S. Teo, and H. Jeong, Error suppression in multicomponent cat codes with photon subtraction and teleamplification, arXiv preprint: arxiv.org/abs/2401.04439

## System requirements
Here is the list of required software to run all codes:
* MATLAB
* Mathematica
* LaTeX
* ToMatlab (Mathematica package)
* MaTeX (Mathematica package)
* QETLAB (MATLAB package)

## Package content
* `/Mathematica/`: contains Mathematica notebooks
  #### `Fidelity and success probability versus loss.nb`
    Contains analytical expressions for the fidelity and success probability considering recovery due to M. Bergmann and P. van Loock, Quantum error correction against photon loss using multicomponent cat states, Phys. Rev. A 94, 042332 (2016) and realistic losses during detection.

  #### `Process matrix and the effect of distortions.nb`
    Contains the derivation for the process matrix for effective loss channel for even-numbered photon subtraction and the effect of distortions on the qubit due to the nonunitary noiseless attenuation and amplification.

  #### `Process matrix for oddPS.nb`
    Process matrix for odd-numbered photon subtraction.

  #### `Testing success prob.nb`
    Contains tests for the total success probability adding to 100%.

  #### `WignerPlots.nb`
    Contains Wigner distributions of the four-component cat states.

* `/MATLAB/`: contains MATLAB code files and functions
  #### `PlotsVLoss.m`
    Computes and plots fidelity and success probability versus channel loss.

  #### `PlotsvT.m`
    Computes and plots fidelity and success probability versus beamsplitter transmittance.

  #### `gdconA.m`
    Implements constrained gradient ascent over CPTP Choi matrices together with minimization over pure states.
