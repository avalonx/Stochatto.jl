using Test
using Stochatto, MIDI


@testset "Note Generation" begin
    note = Note(60, 0, 0, 0)
    major_scale = note .+ Interval.(MAJOR .- 1)
    @test major_scale[1] == note
    @test note - MAJOR_CHORD.notes[1] == note
end

@testset "Algorithms" begin
    N = 1000
    R = 0.01:0.01:0.99
    X = zeros((N, length(R)))
    for (j, rho) in enumerate(R)
        X[:,j] = acf_series(N, rho)
    end
    A = [cor(X[1:N-1,j], X[2:N,j]) for j in 1:size(X,2)]
    @test cor(A, R) >= 0.99
end
