% Digital Image Processing : Lab Task - 7

word = 'ABBAS';
code = arithmetic_coding(word)

function code = arithmetic_coding(word)
alphabet = ['A', 'B', 'S'];
probability = [2/5, 2/5, 1/5];


left = 0;
right = 1;
cumulative_probab = [0, cumsum(probability)];


for i = 1:length(word)
    
    symbol_idx = find(alphabet == word(i));
    symbol_left = left + (right - left) * cumulative_probab(symbol_idx);
    symbol_right = left + (right - left) * cumulative_probab(symbol_idx+1);
    
    
    left = symbol_left;
    right = symbol_right;
end


code = (left + right) / 2;
end