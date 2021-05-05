function [bestEpsilon bestF1 cvPred] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%
cvPred = zeros(size(pval,1));
bestEpsilon = 0;
bestF1 = 0;
F1 = 0;
##    [mu sigma2] = estimateGaussian(Xval);
##    p = multivariateGaussian(Xval, mu, Sigma2);
stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)
    
    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the F1 score of choosing epsilon as the
    %               threshold and place the value in F1. The code at the
    %               end of the loop will compare the F1 score for this
    %               choice of epsilon and set it to be the best epsilon if
    %               it is better than the current choice of epsilon.
    %               
    % Note: You can use predictions = (pval < epsilon) to get a binary vector
    %       of 0's and 1's of the outlier predictions

##      WHAT AM I DOING IN THIS QUESTION?
##
##      1. Calculating prob(Xval)

    ##Do this outside of the loop
    ##[mu sigma2] = estimateGaussian(Xval);
    ##p = multivariateGaussian(Xval, mu, Sigma2);
    
##      2. Comparing prob(Xval) and threshold to make a binary vector called cvPred
##           y=1 if prob(Xval) < threshold    ANOMALY
##           y=0 if prob(Xval) >= threshold   OKAY
  %cvPred = zeros(size(pval,1));
  cvPred = (pval < epsilon); 
  %sum(cvPred == 1)
  %cvPred = cvPred';
  %cvPred(pval >= epsilon) = 0;

##Doing it in a loop
##for i = 1:size(pval,1)
##  if pval(i) < epsilon
##    cvPred(i) = 1;
##  else
##    cvPred(i) = 0;
##  endif
##end

    tp = sum((sum(cvPred == 1)) & (yval == 1))
    fp = sum((sum(cvPred == 1)) & (yval == 0))
    fn = sum((sum(cvPred == 0)) & (yval == 1))
    tn = sum((sum(cvPred == 0)) & (yval == 0))


##      3. Compute Precision

    prec = tp/(tp + fp);

##      4. Compute Recall

    rec = tp/(tp + fn);

##      5. Compute F1-Score

    F1 = 2 * (prec * rec)/(prec + rec);

% DONT DO!!!     6. Evaluate each F1-Score to find best threshold

    % =============================================================

    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
    cvPred = [];
    cvPred = zeros(size(pval,1));
endfor


end
