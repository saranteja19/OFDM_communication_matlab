function [encodedBits] = myRepEncoder(inputBits,repetitions)
encodedBits = repelem(inputBits,repetitions);
end