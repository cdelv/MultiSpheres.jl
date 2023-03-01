include("../../src/Granulars.jl")

function main()
    # Simulation parameters
    g = [0.0,0.0,0.0]

    p1 = Particle(r=[10, 10, 10], v=[0.0,0.0,0], w=[0,0,0], rad=2.0, E=1000, ν=-0.5)
    p2 = Particle(r=[13, 10, 10], v=[10.0,0.0,0], w=[0,0,0], rad=2.0, E=1000, ν=-0.5)
    particles = [p1,p2]

    # Estimate a good time step
    vis_steps = 50
    frames = 200
    dt = 0.0001
    println("dt = ", dt)

    # Create config
    t = frames*vis_steps*dt
    conf = Config(t, dt, g=g, beam_forces=true)

    # Run the simulation
    Propagate(particles, conf, vis_steps=vis_steps, file="Paraview/data", 
        save=true, fixed_spheres=[1], static=true)
end

@time main();