% Digital Image Processing : Lab Task - 5

function [codes, codelength, efficiency] = my_huffman(probabilities)

    % Validate input probabilities
    if abs(sum(probabilities) - 1) > eps || any(probabilities < 0)
        error('Invalid input probabilities. Probabilities must be positive and sum up to 1.');
    end

    % Define tree node structure
    tree_node(1) = struct('left', [], 'right', [], 'probability', [], 'symbol', []);

    % Initialize queue with leaf nodes for each symbol
    queue = cell(1, numel(probabilities));
    for i = 1:numel(probabilities)
        node = tree_node;
        node(1).probability = probabilities(i);
        node(1).symbol = i;
        queue{i} = node;
    end

    % Build the Huffman tree
    while numel(queue) > 1
        [~, order] = sort(cellfun(@(x) x(1).probability, queue));
        queue = queue(order);
        new_node = tree_node;
        new_node(1).left = queue{1};
        new_node(1).right = queue{2};
        new_node(1).probability = new_node(1).left(1).probability + new_node(1).right(1).probability;
        queue = [{new_node}, queue(3:end)];
    end

    % Traverse the Huffman tree to generate codes for each symbol
    root = queue{1};
    codes = cell(size(probabilities));
    traverse_tree(root, '');

    % Calculate the average codelength and efficiency
    codelength = cellfun(@length, codes) * probabilities';
    entropy = -sum(probabilities .* log2(probabilities));
    efficiency = entropy / codelength;

    % Define the tree traversal function
    function traverse_tree(node, code)
        if isempty(node(1).left) && isempty(node(1).right)
            codes{node(1).symbol} = code;
        else
            if ~isempty(node(1).left)
                traverse_tree(node(1).left, [code, '0']);
            end
            if ~isempty(node(1).right)
                traverse_tree(node(1).right, [code, '1']);
            end
        end
    end
end
