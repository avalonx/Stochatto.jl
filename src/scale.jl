# standard scales
const CHROMATIC = [0, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
const NATURAL_MINOR = [0, 3, 4, 6, 8, 9, 11]
const HARMONIC_MINOR = [0, 3, 4, 6, 8, 9, 12]
const MELODIC_MINOR = [0, 3, 4, 6, 8, 10, 12]
const MAJOR = [0, 3, 5, 6, 8, 10, 12]
const MINOR = NATURAL_MINOR

# modes
const IONIAN = [0, 3, 5, 6, 8, 10]         # (I) same as major
const DORIAN = [0, 3, 4, 6, 8, 9, 11]      # (II)
const PHRYGIAN = [0, 2, 4, 6, 8, 9, 11]    # (III)
const LYDIAN = [0, 3, 5, 7, 8, 10, 10]     # (IV)
const MIXOLYDIAN = [0, 3, 5, 6, 8, 10, 11] # (V)
const AEOLIAN = [0, 3, 4, 6, 8, 9, 11]     # (VI) same as natural minor
const LOCRIAN = [0, 2, 4, 6, 7, 9, 11]     # (VII)

# dictionaries containing all elements
const SCALES = Dict("Chromatic" => CHROMATIC,
                    "Major" => MAJOR,
                    "Minor" => NATURAL_MINOR,
                    "Harmonic Minor" => HARMONIC_MINOR)
const MODES = Dict("Ionian" => IONIAN,
                   "Dorian" => DORIAN,
                   "Phrygian" => PHRYGIAN,
                   "Lydian" => LYDIAN,
                   "Mixolydian" => MIXOLYDIAN,
                   "Aeolian" => AEOLIAN,
                   "Locrian" => LOCRIAN)
