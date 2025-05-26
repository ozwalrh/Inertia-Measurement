# %%
# =========================
# SECTION: Import necessary libraries

import numpy as np
import pandas as pd # Pandas for data manipulation in DataFrame format
import matplotlib.pyplot as plt # for plotting
from mpl_toolkits.mplot3d import Axes3D # for 3D plotting
# =========================

# %%
# =========================
# SECTION: Functions for computation

def compute_rotations(theta_x, theta_z):
    """
    Compute rotation matrices for a body attached to a U-Joint
    based on the angles of rotation around the x and z axes.
    Parameters
    ----------
    theta_x : array-like
        Angles of rotation around the x-axis in radians (global reference frame).
    theta_z : array-like
        Angles of rotation around the z-axis in radians (global reference frame).
    Returns
    -------
    rotation_matrices : np.ndarray
        Array of rotation matrices corresponding to the input angles.
    """
    
    # Initialize a list to store rotation matrices
    rotation_matrices = []
    
    # Iterate over the angles    
    for x, z in zip(theta_x, theta_z):
        
        # Rotation around the z-axis
        Rz = np.array([
            [np.cos(z), -np.sin(z),  0],
            [np.sin(z),  np.cos(z),  0],
            [        0,          0,  1]
            ])
        
        # Rotation around the x-axis
        Rx = np.array([
            [1,         0,          0],
            [0, np.cos(x), -np.sin(x)],
            [0, np.sin(x),  np.cos(x)]
            ])
        
        # Multimply both matrices to get the final rotation matrix 
        R_matrix = Rx @ Rz

        # Append the rotation matrix to the list
        rotation_matrices.append(R_matrix)

    # Convert the list of rotation matrices to a numpy array    
    rotation_matrices = np.array(rotation_matrices)
    
    return rotation_matrices

def compute_positions(rotation_matrices, rod_vector, P_0):
    """
    Compute the positions of the end of the rod based on 
    the rotation matrices, direction vector and origin position.
    Parameters
    ----------
    rotation_matrices : np.ndarray
        Array of rotation matrices corresponding to the input angles.
    rod_vector : array-like
        Direction vector of the rod in the body frame.
    P_0 : array-like
        Origin position of the rod in the global reference frame.
    Returns
    -------
    rod_positions : np.ndarray
        Array of positions of the end of the rod in the global reference frame.
    """
    
    # Initialize a list to store the positions of the rods
    rod_positions = []
    
    for R in rotation_matrices:
        # Compute the position of the rod
        position = P_0 + R @ rod_vector
        
        # Append the position to the list
        rod_positions.append(position)
    
    # Convert the list of rod positions to a numpy array    
    rod_positions = np.array(rod_positions)
    
    return rod_positions

def compute_derivatives(df):
    """
    Compute the first and second derivatives of the angles of rotation
    around the x and z axes for each U-Joint in the dataframe.
    Parameters
    ----------
    df : pd.DataFrame
        DataFrame containing the time and angles of rotation for each U-Joint.
    Returns
    -------
    df : pd.DataFrame
        DataFrame with additional columns for the first and second derivatives of the angles.
    """

    # Extract the angles and time from the dataframe
    time = df['Time'].to_numpy()
    U1_theta_x = df['U1Rx'].to_numpy()
    U1_theta_z = df['U1Rz'].to_numpy()
    U2_theta_x = df['U2Rx'].to_numpy()
    U2_theta_z = df['U2Rz'].to_numpy()
    U3_theta_x = df['U3Rx'].to_numpy()
    U3_theta_z = df['U3Rz'].to_numpy()

    array_length = len(U1_theta_x)

    U1_dtheta_x = np.zeros(array_length)
    U2_dtheta_x = np.zeros(array_length)
    U3_dtheta_x = np.zeros(array_length)
    U1_dtheta_z = np.zeros(array_length)
    U2_dtheta_z = np.zeros(array_length)
    U3_dtheta_z = np.zeros(array_length)

    U1_ddtheta_x = np.zeros(array_length)
    U2_ddtheta_x = np.zeros(array_length)
    U3_ddtheta_x = np.zeros(array_length)
    U1_ddtheta_z = np.zeros(array_length)
    U2_ddtheta_z = np.zeros(array_length)
    U3_ddtheta_z = np.zeros(array_length)

    # Compute the first derivatives
    # Central differences for the middle points    
    for i in range(1, len(U1_theta_x)-1):
        dt = time[i+1] - time[i-1]
        U1_dtheta_x[i] = (U1_theta_x[i+1] - U1_theta_x[i-1]) / dt
        U1_dtheta_z[i] = (U1_theta_z[i+1] - U1_theta_z[i-1]) / dt
        U2_dtheta_x[i] = (U2_theta_x[i+1] - U2_theta_x[i-1]) / dt
        U2_dtheta_z[i] = (U2_theta_z[i+1] - U2_theta_z[i-1]) / dt
        U3_dtheta_x[i] = (U3_theta_x[i+1] - U3_theta_x[i-1]) / dt
        U3_dtheta_z[i] = (U3_theta_z[i+1] - U3_theta_z[i-1]) / dt
    
    # Forward differences for the first frame
    dt_0 = time[1] - time[0]
    U1_dtheta_x[0] = (U1_theta_x[1] - U1_theta_x[0]) / dt_0
    U1_dtheta_z[0] = (U1_theta_z[1] - U1_theta_z[0]) / dt_0
    U2_dtheta_x[0] = (U2_theta_x[1] - U2_theta_x[0]) / dt_0
    U2_dtheta_z[0] = (U2_theta_z[1] - U2_theta_z[0]) / dt_0
    U3_dtheta_x[0] = (U3_theta_x[1] - U3_theta_x[0]) / dt_0
    U3_dtheta_z[0] = (U3_theta_z[1] - U3_theta_z[0]) / dt_0

    # Backwar differences for the last frame
    dt_f = time[-1] - time[-2]
    U1_dtheta_x[-1] = (U1_theta_x[-1] - U1_theta_x[-2]) / dt_f
    U1_dtheta_z[-1] = (U1_theta_z[-1] - U1_theta_z[-2]) / dt_f
    U2_dtheta_x[-1] = (U2_theta_x[-1] - U2_theta_x[-2]) / dt_f
    U2_dtheta_z[-1] = (U2_theta_z[-1] - U2_theta_z[-2]) / dt_f
    U3_dtheta_x[-1] = (U3_theta_x[-1] - U3_theta_x[-2]) / dt_f
    U3_dtheta_z[-1] = (U3_theta_z[-1] - U3_theta_z[-2]) / dt_f

    # Compute the second derivatives
    # Central differences for the middle points 
    for i in range(1, len(U1_dtheta_x)):
        dt = time[i+1] - time[i-1]
        U1_ddtheta_x[i] = (U1_dtheta_x[i+1] - U1_dtheta_x[i-1]) / dt
        U2_ddtheta_x[i] = (U2_dtheta_x[i+1] - U2_dtheta_x[i-1]) / dt
        U3_ddtheta_x[i] = (U3_dtheta_x[i+1] - U3_dtheta_x[i-1]) / dt
        U1_ddtheta_z[i] = (U1_dtheta_z[i+1] - U1_dtheta_z[i-1]) / dt
        U2_ddtheta_z[i] = (U2_dtheta_z[i+1] - U2_dtheta_z[i-1]) / dt
        U3_ddtheta_z[i] = (U3_dtheta_z[i+1] - U3_dtheta_z[i-1]) / dt

    # Forward differences for the first frame
    dt_0 = time[1] - time[0]
    U1_ddtheta_x[0] = (U1_dtheta_x[1] - U1_dtheta_x[0]) / dt_0
    U1_ddtheta_z[0] = (U1_dtheta_z[1] - U1_dtheta_z[0]) / dt_0
    U2_ddtheta_x[0] = (U2_dtheta_x[1] - U2_dtheta_x[0]) / dt_0
    U2_ddtheta_z[0] = (U2_dtheta_z[1] - U2_dtheta_z[0]) / dt_0
    U3_ddtheta_x[0] = (U3_dtheta_x[1] - U3_dtheta_x[0]) / dt_0
    U3_ddtheta_z[0] = (U3_dtheta_z[1] - U3_dtheta_z[0]) / dt_0

    # Backwar differences for the last frame
    dt_f = time[-1] - time[-2]
    U1_ddtheta_x[-1] = (U1_dtheta_x[-1] - U1_dtheta_x[-2]) / dt_f
    U1_ddtheta_z[-1] = (U1_dtheta_z[-1] - U1_dtheta_z[-2]) / dt_f
    U2_ddtheta_x[-1] = (U2_dtheta_x[-1] - U2_dtheta_x[-2]) / dt_f
    U2_ddtheta_z[-1] = (U2_dtheta_z[-1] - U2_dtheta_z[-2]) / dt_f
    U3_ddtheta_x[-1] = (U3_dtheta_x[-1] - U3_dtheta_x[-2]) / dt_f
    U3_ddtheta_z[-1] = (U3_dtheta_z[-1] - U3_dtheta_z[-2]) / dt_f

    # add the derivatives to the dataframe
    df['U1_dtheta_x'] = U1_dtheta_x
    df['U1_dtheta_z'] = U1_dtheta_z
    df['U2_dtheta_x'] = U2_dtheta_x
    df['U2_dtheta_z'] = U2_dtheta_z
    df['U3_dtheta_x'] = U3_dtheta_x
    df['U3_dtheta_z'] = U3_dtheta_z
    df['U1_ddtheta_x'] = U1_ddtheta_x
    df['U1_ddtheta_z'] = U1_ddtheta_z
    df['U2_ddtheta_x'] = U2_ddtheta_x
    df['U2_ddtheta_z'] = U2_ddtheta_z
    df['U3_ddtheta_x'] = U3_ddtheta_x
    df['U3_ddtheta_z'] = U3_ddtheta_z
    
    return df

def compute_joint_velocity(theta_x, theta_z, dtheta_x, dtheta_z, rod_vector):
    """
    Compute the velocity of a point on a body attached to a U-Joint
    based on the angles of rotation around the x and z axes.
    Parameters
    :theta_x: array-like
        Angles of rotation around the x-axis in radians in global reference frame.
    :theta_z: array-like
        Angles of rotation around the z-axis in radians in global reference frame.
    :dtheta_x: array-like
        Angular velocities around the x-axis in radians per second in global reference frame.
    :dtheta_z: array-like
        Angular velocities around the z-axis in radians per second in global reference frame.
    :rod_vector: array-like
        Vector the connects the end point and origin of the rod.
    :return: np.ndarray
        Array of velocities corresponding to the input angles and position vector.
    """
    # Initialize a list to store velocities
    velocities = []

    # Loop through the angles and their derivatives
    for x, z, dx, dz in zip(theta_x, theta_z, dtheta_x, dtheta_z):
        
        # Compute the Rotation matrices
        Rz = np.array([
            [np.cos(z), -np.sin(z), 0],
            [np.sin(z),  np.cos(z), 0],
            [0, 0, 1]
            ])
        Rx = np.array([
            [1, 0, 0],
            [0, np.cos(x), -np.sin(x)],
            [0, np.sin(x),  np.cos(x)]
            ])
        R = Rx @ Rz

        # Compute the angular velocity
        omega = Rx @ np.array([0, 0, dz]) + np.array([dx, 0, 0])

        # Compute the global position vector
        r = R @ rod_vector

        # Compute the velocity using the cross product
        velocity = np.cross(omega, r)
        
        # Append the velocity to the list
        velocities.append(velocity)

    return np.array(velocities)

def compute_joint_acceleration(theta_x, theta_z, dtheta_x, dtheta_z, ddtheta_x, ddtheta_z, rod_vector):
    """
    Compute the acceleration of a point on a body attached to a U-Joint
    based on the angles of rotation around the x and z axes.
    :theta_x: array-like
        Angles of rotation around the x-axis in radians.
    :theta_z: array-like
        Angles of rotation around the z-axis in radians.
    :dtheta_x: array-like
        Angular velocities around the x-axis in radians per second.
    :dtheta_z: array-like
        Angular velocities around the z-axis in radians per second.
    :ddtheta_x: array-like
        Angular accelerations around the x-axis in radians per second squared.
    :ddtheta_z: array-like
        Angular accelerations around the z-axis in radians per second squared.
    :rod_vector: array-like
        Vector the connects the end point and origin of the rod.
    """
    accelerations = []

    # Loop through the angles and their first and second derivatives
    for x, z, dx, dz, ddx, ddz in zip(theta_x, theta_z, dtheta_x, dtheta_z, ddtheta_x, ddtheta_z):
        # Rotation matrices
        Rz = np.array([
            [np.cos(z), -np.sin(z), 0],
            [np.sin(z),  np.cos(z), 0],
            [        0,          0, 1]
        ])
        Rx = np.array([
            [1,         0,          0],
            [0, np.cos(x), -np.sin(x)],
            [0, np.sin(x),  np.cos(x)]
        ])
        R = Rx @ Rz

        dRx = dx * np.array([
            [0,          0,          0],
            [0, -np.sin(x), -np.cos(x)],
            [0,  np.cos(x), -np.sin(x)]
        ])
        
        # Angular velocity
        omega = Rx @ np.array([0, 0, dz]) + np.array([dx, 0, 0])
        
        # Angular acceleration
        alpha = Rx @ np.array([0, 0, ddz]) + np.array([ddx, 0, 0]) + dRx @ np.array([0, 0, dz])

        # Compute the global position vector
        r = R @ rod_vector

        # Compute the acceleration using the cross product and the angular acceleration
        a = np.cross(alpha, r) + np.cross(omega, np.cross(omega, r))
        
        # Append the acceleration to the list
        accelerations.append(a)

    return np.array(accelerations)

def compute_orientation(P1, P2, P3):
    """
    Compute the Rotation matrix for the orientation defined 
    by the coordinates of 3 points.
    Parameters
    ----------
    P1 : array-like
        Coordinates of the first point in the global reference frame.
    P2 : array-like
        Coordinates of the second point in the global reference frame.
    P3 : array-like
        Coordinates of the third point in the global reference frame.
    Returns
    -------
    R_matrix : np.ndarray
        Rotation matrix corresponding to the orientation defined by the points.
    """
    # Define a lambda function to normalize vectors
    normalize = lambda x: x / np.linalg.norm(x)

    # Compute the normal vector of the plane defined by P1, P2, and P3
    v1 = normalize(P2 - P1)
    v2 = normalize(P3 - P1)
    
    # Define the first vector as the vector of P1 to P2
    # this will be the x-axis of the local frame
    X = v1
    
    # Compute the cross product to get the normal vector and normalize it
    # this will be the y-axis of the local frame
    Y = normalize(np.cross(v2, v1))
    
    # Compute the cross product to get the third vector and normalize it
    # this will be the z-axis of the local frame
    Z = normalize(np.cross(X, Y))

    # Build the rotation matrix
    R_matrix = np.array([X, Y, Z]).T
    
    return R_matrix

def compute_body_orientation(P1_list, P2_list, P3_list):
    """
    Compute the body orientation based on the positions of the spherical joints.
    Parameters
    ----------
    P1_list : list of array-like
        List of coordinates of the first point in the global reference frame.
    P2_list : list of array-like
        List of coordinates of the second point in the global reference frame.
    P3_list : list of array-like
        List of coordinates of the third point in the global reference frame.
    Returns
    -------
    rotation_matrices : np.ndarray
        Array of rotation matrices corresponding to the orientation defined by the points.  
    """
    # Initialize a list to store the rotation matrices
    rotation_matrices = []
    
    # Loop through the lists of points
    for P1, P2, P3 in zip(P1_list, P2_list, P3_list):
        # Compute the rotation matrix for each set of positions
        R_matrix = compute_orientation(P1, P2, P3)
        
        # Append the rotation matrix to the list
        rotation_matrices.append(R_matrix)
    
    # Convert the lists to a numpy array    
    rotation_matrices = np.array(rotation_matrices)
    
    return rotation_matrices

def compute_body_omega(rotation_matrices, df):
    """
    Compute angular velocity from a sequence of rotation matrices and time data.
    Parameters:
    ----------
    - rotation_matrices: Nx3x3 array of rotation matrices
    - df: pandas DataFrame with a 'Time' column
    Returns:
    -------
    - omega: Nx3 array of angular velocity vectors in global frame
    """
    # Extract time from the DataFrame
    time = df['Time'].to_numpy()
    N = len(time)
    
    # Initialize arrays for Rotation Matrices derivatives and angular velocities
    R_dots = np.zeros_like(rotation_matrices)
    omega = np.zeros((N, 3))

    # Compute the derivatives
    # Central differences for the middle points
    for i in range(1, N - 1):
        dt = time[i + 1] - time[i - 1]
        R_dots[i] = (rotation_matrices[i + 1] - rotation_matrices[i - 1]) / dt

    # Endpoints: forward/backward
    R_dots[0] = (rotation_matrices[1] - rotation_matrices[0]) / (time[1] - time[0])
    R_dots[-1] = (rotation_matrices[-1] - rotation_matrices[-2]) / (time[-1] - time[-2])

    # Compute omega from skew matrix
    for i in range(N):
        skew_omega = R_dots[i] @ rotation_matrices[i].T
        
        # The omega vector is derived from the skew-symmetric matrix
        # the elements either side of the diagonal are averaged to get the angular velocity vector
        omega[i] = 0.5 * np.array([
            skew_omega[2, 1] - skew_omega[1, 2],
            skew_omega[0, 2] - skew_omega[2, 0],
            skew_omega[1, 0] - skew_omega[0, 1]
        ])

    return omega

def compute_body_alpha(angular_velocities, df):
    """
    Compute angular acceleration from a sequence of angular velocities and time data.
    ----------
    Parameters:
    - angular_velocities: Nx3 array of angular velocity vectors
    - df: pandas DataFrame with a 'Time' column
    ----------
    Returns:
    - alpha: Nx3 array of angular acceleration vectors in global frame
    """
    # Extract time from the DataFrame
    time = df['Time'].to_numpy()
    N = len(time) # number of time steps
    
    # Initialize array for angular accelerations
    alpha = np.zeros((N, 3))

    # Compute the derivatives
    # Central differences for the middle points
    for i in range(1, N - 1):
        dt = time[i + 1] - time[i - 1]
        alpha[i] = (angular_velocities[i + 1] - angular_velocities[i - 1]) / dt

    # Endpoints: forward/backward
    alpha[0] = (angular_velocities[1] - angular_velocities[0]) / (time[1] - time[0])
    alpha[-1] = (angular_velocities[-1] - angular_velocities[-2]) / (time[-1] - time[-2])

    return alpha

def transform_global_to_local(vectors, rotation_matrices):
    """
    Transform global vectors into the local frame using rotation matrices.
    Parameters
    ---------- 
    vectors: Nx3 array of global vectors (e.g., angular velocity)
    rotation_matrices: Nx3x3 array of rotation matrices
    Returns
    ----------
    Nx3 array of vectors in local frames
    """
    # Performs a batch matrix-vector multiplication
    # between a sequence of rotation matrices and a sequence of vectors.
    return np.einsum('nij,nj->ni', rotation_matrices.transpose(0, 2, 1), vectors)

def tilde(v):
    """
    Compute the skew symmetric matrix of a 3x1 vector v.
    The skew symmetric matrix is defined as:
    [  0   -v[2]  v[1] ]
    [ v[2]   0   -v[0] ]
    [-v[1]  v[0]   0   ]
    """
    if len(v) != 3:
        raise ValueError("Input vector must be of length 3.")
    # Check if v is a numpy array, if not convert it to one
    # This is important for the case when v is a list or tuple
    if not isinstance(v, np.ndarray):
        v = np.array(v)
    
    # Compute the skew symmetric matrix
    v_tilde = np.array([
        [  0,  -v[2], v[1]],
        [ v[2],  0,  -v[0]],
        [-v[1], v[0],  0  ]
        ])
    
    return v_tilde

def tilde_list(vectors):
    """Compute the skew symmetric matrix representation of a list of 3x1 vectors."""
    
    # Initialize an empty list to store the skew symmetric matrices
    tildelist = []
    
    # Iterate over the list of vectors and compute the skew symmetric matrix for each
    for v in vectors:
        tildelist.append(tilde(v))
    
    return np.array(tildelist)

def build_matrix_A(omega, alpha):
    """
    Build the list of "matrices a" from the angular velocities and accelerations.
    These matrices are used to compute the forces acting on the body.
    Parameters
    ----------
    omega: array of angular velocities
    alpha: array of angular accelerations
    Returns
    ----------
    matrix_A: list of 3x3 "matrices a"
    """
    # Compute the skew symmetric matrices for omega and alpha    
    omega_tilde = tilde_list(omega)
    alpha_tilde = tilde_list(alpha)

    # Initialize the list to store the matrices 
    matrix_A = []

    # Iterate over the skew symmetric matrices and compute the "matrices a"
    for ot, at in zip(omega_tilde, alpha_tilde):
        # Skip rows where either ot or at is NaN
        if isinstance(ot, float) and np.isnan(ot) or isinstance(at, float) and np.isnan(at):
            matrix_A.append(np.nan)  # Append NaN for missing entries
        else:
            # the "matrix a" is computed as:
            # A = omega (cross) omega + skew(alpha) or:
            # A = skew(omega) @ skew(omega) + skew(alpha)
            mat = ot @ ot + at
            # append the computed matrix to the list
            matrix_A.append(mat)
    
    return matrix_A  # Return the list of matrices

def compute_r_PG(df, acl, g, mass):
    """
    Compute the vector from the reference point P to the center of gravity G (r_PG).

    Parameters:
    ----------
    df: DataFrame with joint forces in the local reference frame and A matrix data
    acl: vector of the accelereations of the reference point (Joint 1) in the local reference frame (3,)
    g: gravity vector in the local reference frame (3,)
    mass: scalar mass of the system in kg

    Returns:
    ----------
    r_PG: vector from the reference point P to G (ceter of gravity) in the local reference frame (3,)
    """
    # Extract joint forces into 3D vectors
    j1 = np.array([[j1x, j1y, j1z] for j1x, j1y, j1z in zip(df['J1_fx'], df['J1_fy'], df['J1_fz'])])
    j2 = np.array([[j2x, j2y, j2z] for j2x, j2y, j2z in zip(df['J2_fx'], df['J2_fy'], df['J2_fz'])])
    j3 = np.array([[j3x, j3y, j3z] for j3x, j3y, j3z in zip(df['J3_fx'], df['J3_fy'], df['J3_fz'])])    

    # Total joint forces
    forces = j1 + j2 + j3

    # Extract A matrices and compute net force vectors
    A = df['A'].values
    F = forces / mass - acl - g

    # Filter out invalid entries in A and F
    # Ensure A is a list of 3x3 matrices and F is a list of 3D vectors
    valid_indices = [i for i, a in enumerate(A) if isinstance(a, np.ndarray) and a.shape == (3, 3)]
    A_valid = [A[i] for i in valid_indices]
    F_valid = [F[i] for i in valid_indices]

    # initialize lists for filtered A matrices and F vectors
    A_filtered = []
    F_filtered = []

    # Compute the condition number and filter matrices
    for a, f in zip(A_valid, F_valid):
        if np.any(np.isnan(a)) or np.any(np.isnan(f)):
            continue
        cond = np.linalg.cond(a)
        if cond < 1e12:  # Filter based on condition number
            A_filtered.append(a)
            F_filtered.append(f)

    if not A_filtered:
        raise ValueError("No valid A matrices after filtering.")

    # Stack matrices and vectors for least-squares solution
    A_stacked = np.vstack(A_filtered)
    F_stacked = np.hstack(F_filtered)

    # Solve for the vector of coordinates (x, y, z) in the least-squares sense
    r_GP, residuals, rank, s = np.linalg.lstsq(A_stacked, F_stacked, rcond=None)
    r_PG = -r_GP # Invert the vector to get from P to G

    # Print the result in the console
    print("r_GP = ", r_GP)

    return r_PG

def build_matrix_N(omega, alpha):
    """
    Compute the N matrix for each row in the dataframe.
    N is defined as:
    N = skew(omega) @ (I @ omega) + I @ alpha
    where I is the inertia tensor.
    Parameters
    ----------
    omega: array of angular velocities in the local reference frame (3,)
    alpha: array of angular accelerations in the local reference frame (3,)
    Returns
    ----------
    list of (3, 9) numpy arrays representing the torque mapping matrix
    for an asymmetric inertia tensor. Invalid entries are filled with NaN.
    """
    # Initialize the result list with NaN placeholders
    mat_n = [np.nan] * len(omega)

    # Loop through the omega and alpha arrays
    for i, (w, a) in enumerate(zip(omega, alpha)):
        # Skip rows with invalid omega or alpha
        if not isinstance(w, np.ndarray) or not isinstance(a, np.ndarray) or np.isnan(w).any() or np.isnan(a).any():
            continue

        wx, wy, wz = w # Unpack angular velocity components
        ax, ay, az = a # Unpack angular acceleration components

        omega_vec = np.array([wx, wy, wz]) # Angular velocity vector
        omega_skew = tilde(omega_vec) # Compute the skew symmetric matrix of omega

        # Linear part from I * alpha
        # Assuming inertia tensor I is diagonal with components ax, ay, az
        n_alpha = np.zeros((3, 9)) # Initialize the matrix for alpha contributions
        # Fill the diagonal blocks with the components of alpha
        n_alpha[0, 0:3] = [ax, ay, az] 
        n_alpha[1, 3:6] = [ax, ay, az]
        n_alpha[2, 6:9] = [ax, ay, az]

        # Matrix that maps J (flattened inertia) to I * omega
        I_omega = np.array([
            [wx, wy, wz,  0,  0,  0,  0,  0,  0],
            [ 0,  0,  0, wx, wy, wz,  0,  0,  0],
            [ 0,  0,  0,  0,  0,  0, wx, wy, wz]
        ])

        # Final N = skew(omega) @ (I @ omega) + I @ alpha
        n = omega_skew @ I_omega + n_alpha
        
        # append the computed matrix to the result list
        mat_n[i] = n

    return mat_n

def compute_torques(df, r1, r2, r3):
    """Compute torques based on the given dataframe and positions.
    Parameters
    ----------
    df : pd.DataFrame
        DataFrame containing the joint forces in the local reference frame.
    r1, r2, r3 : np.ndarray
        3D vectors representing the positions of the joints in the local reference frame.
    """
    # Extract the necessary columns from the DataFrame and arrange them into 3D vectors
    j1 = np.array([[j1x, j1y, j1z] for j1x, j1y, j1z in zip(df['J1_fx'], df['J1_fy'], df['J1_fz'])])
    j2 = np.array([[j2x, j2y, j2z] for j2x, j2y, j2z in zip(df['J2_fx'], df['J2_fy'], df['J2_fz'])])
    j3 = np.array([[j3x, j3y, j3z] for j3x, j3y, j3z in zip(df['J3_fx'], df['J3_fy'], df['J3_fz'])])    

    # Compute the torques using the cross product
    torque = np.cross(r1, j1) + np.cross(r2, j2) + np.cross(r3, j3)
    return torque

def compute_inertia(df):
    """
    Compute the inertia tensor components from the given DataFrame.
    Parameters
    ----------
    df : pd.DataFrame
        DataFrame containing the joint torques and angular velocities.
    Returns
    ----------
    inertia_components : np.ndarray
        Array of inertia tensor components in the order [Ixx, Ixy, Ixz, Iyx, Iyy, Iyz, Izx, Izy, Izz].
    inertia_tensor : np.ndarray
        3x3 inertia tensor matrix.
    Raises
    ----------  
    ValueError: If there are no valid pairs of N and T or if the dimensions of N and T are incompatible.
    ValueError: If the dimensions of N_stacked and T_stacked are incompatible.
    """
    # Extract the necessary columns from the DataFrame
    n = df['n'] # N matrix
    torques = np.array(df['torques'].tolist()) # Torques as a list of arrays
    
    # Initialize lists to store N matrices and torque vectors
    N = []
    Torques = []

    for i in range(len(df)):
        N.append(n[i])
        Torques.append(torques[i].flatten())  # Flatten the torque array to ensure compatibility

    # Filter out invalid entries in N and T simultaneously
    valid_pairs = [(n_elem, t_elem) for n_elem, t_elem in zip(N, Torques) if n_elem is not np.nan and t_elem is not np.nan]

    # Separate the filtered N and T
    if valid_pairs:  # Ensure there are valid pairs
        N_filtered, T_filtered = zip(*valid_pairs)
        N_filtered = np.array(N_filtered)  # Convert to NumPy array
        T_filtered = np.array(T_filtered)  # Convert to NumPy array
    else:
        raise ValueError('No valid pairs found for N and T.')

    # Reshape N_filtered to match T_filtered
    N_stacked = N_filtered.reshape(-1, N_filtered.shape[-1])
    # Reshape T_filtered to match the number of rows in N_stacked
    T_stacked = T_filtered.flatten()

    # Solve for the inertia tensor components in the least-squares sense
    if N_stacked.shape[0] != T_stacked.shape[0]:
        raise ValueError(f'Incompatible dimensions: N_stacked has {N_stacked.shape[0]} rows, T_stacked has {T_stacked.shape[0]} rows.')

    inertia_components, residuals, rank, s = np.linalg.lstsq(N_stacked, T_stacked, rcond=None)

    # Rearrange the components of the inertia into a 3x3 inertia tensor.
    # the least-squares solution gives us the components in a (9,) vector in the order
    # [Ixx, Ixy, Ixz, Iyx, Iyy, Iyz, Izx, Izy, Izz]

    inertia_tensor = np.array(
        [inertia_components[0], inertia_components[1], inertia_components[2],
         inertia_components[3], inertia_components[4], inertia_components[5],
         inertia_components[6], inertia_components[7], inertia_components[8]
         ]).reshape(3, 3) # ensure the inertia tensor is a 3x3 matrix
    
    return inertia_components, inertia_tensor

def main(data, mass, r_u1, r_u2, r_u3, v_1, v_2, v_3, gravity = np.array([0., -9.80665, 0.]), actual_cog=True):
        """Main function to process the data and compute the required values.
        Parameters:
        ---------- 
        data (str): Path to the data file.
        mass (float): Mass of the system [kg].
        r_u1 (array): Position of U joint 1 in the global frame [m].
        r_u2 (array): Position of U joint 2 in the global frame [m].
        r_u3 (array): Position of U joint 3 in the global frame [m].
        v_1 (array): Vector that defines the original orientation of rod 1.
        v_2 (array): Vector that defines the original orientation of rod 2.
        v_3 (array): Vector that defines the original orientation of rod 3.
        gravity (array): Gravity vector in the global frame. Default is [0., -9.80665, 0.], unit = m/s^2.
        available options are:
        actual_cog (bool): If True, compute the Inertia tensor using the real coordinates of the CoG
        the actual CoG is hardcoded to be at the origin of the global reference frame (0, 0, 0). 
        """

        # Read the data from the file and create a DataFrame
        df = pd.read_csv(data, sep='\s+', skiprows=1, header=0)
        df.columns = df.columns.str.strip()  # remove leading/trailing whitespace for column names

        # Define the required columns for the DataFrame
        # These columns are expected to be present in the DataFrame
        # U1Rx, U1Rz, U2Rx, U2Rz, U3Rx, U3Rz are the angles of the U-joints around the x and z axes
        # J1_fx, J1_fy, J1_fz, J2_fx, J2_fy, J2_fz, J3_fx, J3_fy, J3_fz are the forces at the spherical joints
        required_columns = ['U1Rx', 'U1Rz', 'U2Rx', 'U2Rz', 'U3Rx', 'U3Rz', 'J1_fx', 'J1_fy', 'J1_fz',
                            'J2_fx', 'J2_fy', 'J2_fz', 'J3_fx', 'J3_fy', 'J3_fz',]
        
        # Check if all required columns are present, 
        # if any are missing, raise an error and print the missing and current columns
        if not all(col in df.columns for col in required_columns):
                missing_columns = [col for col in required_columns if col not in df.columns]
                raise ValueError(f"DataFrame is missing the columns: {missing_columns}. "
                        f"Currently present columns: {list(df.columns)}. ")

        # Extract the angles for the U-joints from the DataFrame
        U1_angle_z = df['U1Rz'].values
        U1_angle_x = df['U1Rx'].values
        U2_angle_z = df['U2Rz'].values
        U2_angle_x = df['U2Rx'].values
        U3_angle_z = df['U3Rz'].values
        U3_angle_x = df['U3Rx'].values

        # Compute the rotation matrices for each rod
        U1_rotation_matrices = compute_rotations(U1_angle_x, U1_angle_z)
        U2_rotation_matrices = compute_rotations(U2_angle_x, U2_angle_z)
        U3_rotation_matrices = compute_rotations(U3_angle_x, U3_angle_z)

        # Compute the positions of the spherical joints after each rotation
        P1 = compute_positions(U1_rotation_matrices, v_1, r_u1)
        P2 = compute_positions(U2_rotation_matrices, v_2, r_u2)
        P3 = compute_positions(U3_rotation_matrices, v_3, r_u3)

        # Compute the angle derivatives and stores them in the DataFrame 
        df = compute_derivatives(df)

        # Extract the the angle derivatives for the U-joints from the DataFrame
        U1_dth_x = df['U1_dtheta_x'].values
        U1_dth_z = df['U1_dtheta_z'].values
        U2_dth_x = df['U2_dtheta_x'].values
        U2_dth_z = df['U2_dtheta_z'].values
        U3_dth_x = df['U3_dtheta_x'].values
        U3_dth_z = df['U3_dtheta_z'].values

        U1_ddth_x = df['U1_ddtheta_x'].values
        U1_ddth_z = df['U1_ddtheta_z'].values
        U2_ddth_x = df['U2_ddtheta_x'].values
        U2_ddth_z = df['U2_ddtheta_z'].values
        U3_ddth_x = df['U3_ddtheta_x'].values
        U3_ddth_z = df['U3_ddtheta_z'].values

        # Compute the velocities of the spherical joints
        vel1 = compute_joint_velocity(U1_angle_x, U1_angle_z, U1_dth_x, U1_dth_z, r_u1)
        vel2 = compute_joint_velocity(U2_angle_x, U2_angle_z, U2_dth_x, U2_dth_z, r_u2)
        vel3 = compute_joint_velocity(U3_angle_x, U3_angle_z, U3_dth_x, U3_dth_z, r_u3)

        # Compute the accelerations of the spherical joints
        acl1 = compute_joint_acceleration(U1_angle_x, U1_angle_z, U1_dth_x, U1_dth_z, U1_ddth_x, U1_ddth_z, r_u1)
        acl2 = compute_joint_acceleration(U2_angle_x, U2_angle_z, U2_dth_x, U2_dth_z, U2_ddth_x, U2_ddth_z, r_u2)
        acl3 = compute_joint_acceleration(U3_angle_x, U3_angle_z, U3_dth_x, U3_dth_z, U3_ddth_x, U3_ddth_z, r_u3)

        # Compute the rotation matrices for the body
        body_rotation_matrices = compute_body_orientation(P1, P2, P3)

        # Compute the angular velocities and accelerations of the body in the global frame
        body_angular_velocities = compute_body_omega(body_rotation_matrices, df)
        body_angular_accelerations = compute_body_alpha(body_angular_velocities, df)

        # Compute the angular velocities and accelerations in the local frame
        local_angular_velocities = transform_global_to_local(body_angular_velocities, body_rotation_matrices)
        local_angular_accelerations = transform_global_to_local(body_angular_accelerations, body_rotation_matrices)
        
        # Compute the gravity and acceleration vectors in the local frame
        # Build a list of global gravity vectors, one for each time step
        gravity_vectors = gravity_vectors = np.tile(gravity, (len(local_angular_velocities), 1))
        # Transform the gravity and acceleration vectors to the local frame
        gravity_local = transform_global_to_local(gravity_vectors, body_rotation_matrices)
        acl_local = transform_global_to_local(acl1, body_rotation_matrices)

        # Build the matrix A from the angular velocities and accelerations
        matrix_A = build_matrix_A(local_angular_velocities, local_angular_accelerations)
        df['A'] = list(matrix_A)

        # Compute the vector from the reference point P to the center of gravity G (r_PG) 
        r_PG = compute_r_PG(df, acl_local, gravity_local, mass)
        r_x, r_y , r_z = r_PG

        # Print the vector from the reference point P to the center of gravity G for debugging
        print("Vector from the reference point P to the center of gravity G (r_PG):")
        print("r_PG = ({:.3f}, {:.3f}, {:.3f})".format(r_x, r_y, r_z))
        
        # Compute the center of gravity (CoG) in the global frame 
        # by adding the vector r_PG to the position of the reference point P (Joint 1) P1
        cog = r_PG + P1[0]
        x, y, z = cog # unpack the coordinates of the CoG
        print(" ")
        print("Location of the CoG in the global frame: x = {:.3f}, y = {:.3f}, z = {:.3f}".format(x, y, z))
        print(" ")

        # Build the N matrix for computing the Interia tensor
        df['n'] = build_matrix_N(local_angular_velocities, local_angular_accelerations)

        # Define which coordinates of CoG to use for the inertia tensor
        if actual_cog:
                # Use the actual CoG at the origin of the global reference frame
                inertia_cog = np.array([0., 0., 0.]) 
        else:
                # Use the computed CoG from the data
                inertia_cog = cog 

        r1 = P1[0] - inertia_cog # vector from center of gravity to joint 1
        r2 = P2[0] - inertia_cog # vector from center of gravity to joint 2
        r3 = P3[0] - inertia_cog # vector from center of gravity to joint 3
        
        # Compute torques
        torques = compute_torques(df, r1, r2, r3)

        # Add torques to the DataFrame
        df['torques'] = torques.tolist()  # Save as a list of vectors

        # Compute the inertia tensor components and the inertia tensor itself
        inertia_components, inertia_tensor = compute_inertia(df)
        
        """
        Debugging: Plot local and global frames at specific time steps
        frames_to_print = np.array([0, len(df)//3, 2*len(df)//3, len(df)-1])
        time = df['Time'].to_numpy()

        for i in frames_to_print:
                plot_local_and_global_frames(
                        R=body_rotation_matrices[i],
                        vecs=[gravity_local[i]],
                        labels=["Gravity in local frame"],
                        title=f"Body vs. Global Frame at t = {time[i]:.2f}s"
                )"""

        # Add the computed values to the DataFrame
        # Joint positions
        # Joint 1
        df['P1_x'] = P1[:, 0]
        df['P1_y'] = P1[:, 1]
        df['P1_z'] = P1[:, 2]
        # Joint 2
        df['P2_x'] = P2[:, 0]
        df['P2_y'] = P2[:, 1]
        df['P2_z'] = P2[:, 2]
        # Joint 3
        df['P3_x'] = P3[:, 0]
        df['P3_y'] = P3[:, 1]
        df['P3_z'] = P3[:, 2]
        # Joint 1 acceleration in the local frame
        df['acl_x_local'] = acl1[:, 0]
        df['acl_y_local'] = acl1[:, 1]
        df['acl_z_local'] = acl1[:, 2]
        # angular velocities in the global frame
        df['omega_x_global'] = body_angular_velocities[:, 0]
        df['omega_y_global'] = body_angular_velocities[:, 1]
        df['omega_z_global'] = body_angular_velocities[:, 2]
        # angular accelerations in the global frame
        df['alpha_x_global'] = body_angular_accelerations[:, 0]
        df['alpha_y_global'] = body_angular_accelerations[:, 1]
        df['alpha_z_global'] = body_angular_accelerations[:, 2]
        # angular velocities in the local frame
        df['omega_x_local'] = local_angular_velocities[:, 0]
        df['omega_y_local'] = local_angular_velocities[:, 1]
        df['omega_z_local'] = local_angular_velocities[:, 2]
        # angular accelerations in the local frame
        df['alpha_x_local'] = local_angular_accelerations[:, 0]
        df['alpha_y_local'] = local_angular_accelerations[:, 1]
        df['alpha_z_local'] = local_angular_accelerations[:, 2]
        # gravity vector in the local frame
        df['gravity_x_local'] = gravity_local[:, 0]
        df['gravity_y_local'] = gravity_local[:, 1]
        df['gravity_z_local'] = gravity_local[:, 2]
        # center of gravity coordinates
        df['cog_x'] = cog[0]
        df['cog_y'] = cog[1]
        df['cog_z'] = cog[2]
        # coordinates of the r_PG vector
        df['r_PG_x'] = r_PG[0]
        df['r_PG_y'] = r_PG[1]
        df['r_PG_z'] = r_PG[2]
        # inertia tensor components
        df['Ixx'] = inertia_components[0]
        df['Ixy'] = inertia_components[1]
        df['Ixz'] = inertia_components[2]
        df['Iyx'] = inertia_components[3]
        df['Iyy'] = inertia_components[4]
        df['Iyz'] = inertia_components[5]
        df['Izx'] = inertia_components[6]
        df['Izy'] = inertia_components[7]
        df['Izz'] = inertia_components[8]
        
        # return the DataFrame, center of gravity, and inertia tensor
        return df, cog, inertia_tensor
# =========================
# %%
# =========================
# SECTION: Helper functions for debugging and visualization

def plot_local_and_global_frames(R, vecs, labels, title="Frame Comparison", scale=1.0):
    """
    Plot local body frame, global frame (colored), and vectors in local frame.

    Parameters:
    - R: 3x3 body rotation matrix at a given timestep
    - vecs: list of vectors in local frame
    - labels: corresponding labels for each vector
    - title: plot title
    - scale: arrow length scaling factor
    """
    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')
    origin = np.zeros(3)

    # Plot global frame axes (distinct colors)
    global_colors = ['violet', 'lime', 'aqua']
    for i, color in zip(range(3), global_colors):
        ax.quiver(*origin, *(np.eye(3)[:, i] * scale), color=color, linestyle='-', label=f'Global {["X", "Y", "Z"][i]}')

    # Plot local (body) frame axes (RGB)
    local_colors = ['r', 'g', 'b']
    for i, color in zip(range(3), local_colors):
        ax.quiver(*origin, *(R[:, i] * scale), color=color, linestyle='-', label=f'Local {["X", "Y", "Z"][i]}')

    # Plot any additional vectors (e.g. gravity)
    for vec, label in zip(vecs, labels):
        ax.quiver(*origin, *(vec * scale), color='k', linestyle='dashed', label=label)

    ax.set_xlim([-scale, scale])
    ax.set_ylim([-scale, scale])
    ax.set_zlim([-scale, scale])
    ax.set_title(title)
    ax.set_xlabel("X")
    ax.set_ylabel("Y")
    ax.set_zlabel("Z")
    ax.legend()
    plt.tight_layout()
    plt.show()

def plot_magnitude_error(time, computed, simulated, title="Body Magnitude", units="[]", tolerance=1e-6):
    """
    Plots computed vs. simulated components, absolute error, and percentage error of any given variable.

    Parameters:
    - time: array of time values
    - computed: Nx3 array of computed velocity components
    - simulated: Nx3 array of simulated velocity components
    - title: Title for the plot 
    - units: units of the variable
    - tolerance: threshold to avoid division by zero in percent error
    ----------
    This function creates a 3x3 grid of subplots:
    - First column: Computed vs. Simulated components
    - Second column: Absolute error
    - Third column: Percent error
    ----------
    Sample usage, plotting the position of Joint 1:
    plot_magnitude_error(times, P1, P1_sim, title="Joint 1 Position", units="[m]")
    """
    component_labels = ['x', 'y', 'z']
    fig, axes = plt.subplots(3, 3, figsize=(15, 5), sharex=True)
    fig.suptitle(f"{title} {units}", fontsize=14)
    points_removed_any = False
    
    for i in range(3):
        # Absolute error
        error = computed[:, i] - simulated[:, i]

        # Percent error with tolerance check
        mask = (np.abs(simulated[:, i]) > tolerance)
        percent_error = np.where(
            mask,
            (error / simulated[:, i]) * 100,
            0.0
        )
        points_removed = not np.all(mask)
        if points_removed:
            points_removed_any = True
        

        # Plot computed vs. simulated
        axes[i, 0].plot(time, simulated[:, i], 'r', label='simulation')
        axes[i, 0].plot(time, computed[:, i], 'k--', label='computed')
        axes[i, 0].set_ylabel(f"{component_labels[i]}-component")
        axes[i, 0].legend()

        # Absolute error
        axes[i, 1].plot(time, error, color='dodgerblue')
        axes[i, 1].set_ylabel(f"Error {units}")

        # Percent error
        axes[i, 2].plot(time, percent_error, color='steelblue')
        axes[i, 2].set_ylabel("Error %")

    axes[2, 0].set_xlabel("Time [s]")
    axes[2, 1].set_xlabel("Time [s]")
    axes[2, 2].set_xlabel("Time [s]")

    plt.tight_layout(rect=[0, 0, 1, 0.96])
    plt.show()
    
    if points_removed_any:
        print(f"Points where simulated values were near zero (tolerance = {tolerance}) have been removed from the percent error plots.") 
# =========================
# %%
# =========================
# SECTION: Main execution block to run the script

filepath = 'inertia_sim_data_202505261.tab' # Path to the data file, update as needed
mass = 7801.0  # Mass of the body in kg

# Define the positions of the U-joints in the global frame
P_U1 = np.array([-1.05, 0.8, -0.4])
P_U2 = np.array([1.05, 0.8, -0.4])
P_U3 = np.array([-0.85, 0.8, 0.65])

# Define the rod vectors
r_vector1 = np.array([0.0, -0.687, 0.0])
r_vector2 = np.array([0.0, -0.687, 0.0])
r_vector3 = np.array([0.0, -0.687, 0.0])

# Compute the center of gravity and inertia tensor by calling the main function
df, cog, inertia_tensor = main(filepath, mass, P_U1, P_U2, P_U3, r_vector1, r_vector2, r_vector3, gravity = np.array([0., -9.80665, 0.]))

# Print the results
# Print the CoG
print("Coordinates of Center of Gravity (CoG) in the global frame:")
print("x = {:.3f}, y = {:.3f}, z = {:.3f}".format(cog[0], cog[1], cog[2])) # format the output to 3 decimals places

# Print the inertia tensor
print("Inertia Tensor [kg m^2]:")
print(inertia_tensor)

# =========================
