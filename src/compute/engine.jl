using MIDI, Distributions

mutable struct Engine
    key::Key
    note_generator::Distribution
    beat_generator::Distribution
end

function generate_note(key::Key, initial::Note, generator::Distribution)::Note
    delta = key.ladder .- initial
    idx = findmin(abs.([d.steps for d in delta] .- trunc(Int, rand(generator))))[2]; increment = delta[idx]
    out = initial + delta[idx]
    out.position += initial.duration
    return out
end

function generate_notes(key::Key, initial::Note, generator::Distribution, n::Int)::Notes{Note}
    out = Notes()
    push!(out, initial)
    for i in 2:n
        push!(out, generate_note(key, out[i-1], generator))
    end
    return out
end

function generate_rhythm(notes::Notes{Note}, generator::Distribution, precision::Rational=SIXTEENTH)::Notes{Note}
    beats = round.(1 .// [ceil(Int, max(rand(generator), 1)) for i in 1:length(notes)], digits=1, base=Int(1/precision))
    notes[1].duration = beats[1]*TPQ
    for i in 2:length(notes)
        notes[i].duration = beats[i]*TPQ
        notes[i].position = notes[i-1].duration + notes[i-1].position
    end
    return notes
end

function generate(engine::Engine, n::Int, initial::Note=engine.key.ladder[rand(1:length(engine.key.ladder))], precision::Rational=SIXTEENTH)::Notes{Note}
    notes = generate_notes(engine.key, initial, engine.note_generator, n)
    notes = generate_rhythm(notes, engine.beat_generator, precision)
    return notes
end
