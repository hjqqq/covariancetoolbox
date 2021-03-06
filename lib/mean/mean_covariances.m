% [] = XXXX()
%
% -----------------------------Definition---------------------------------%
%
% description
%
% usage : 
%
% -----------------------------Input--------------------------------------%
%
% XX : description + dimension
%
% -----------------------------Output-------------------------------------%
%
% XX : description + dimension
%
% -----------------------------References---------------------------------%
%
% [1] : XXX
%
%
%   Project : BCI-EEG
%
%   author : A. Barachant
%   date : 2011-XXXX
%   version : 1.0 
%   status : a terminer 
%   CEA/GRENOBLE-LETI/DTBS
%
%   See also MEAN, MEDIAN, RIEMANN_MEAN, REIMANN_MEDIAN, RIEMANN_TRIMMED_MEAN.

% [EOF: XXX.m]

function C = mean_covariances(COV,method_mean,arg_mean)

if (nargin<2)||(isempty(method_mean))
    method_mean = 'arithmetic';
end
if (nargin<3)
    arg_mean = {};
end

switch method_mean
    case 'riemann'
        C = riemann_mean(COV,arg_mean);
    case 'riemanntrim'
        C = riemann_trimmed_mean(COV,arg_mean);    
    case 'median'
        C = median(COV,3);
    case 'riemannmed'
        C = riemann_median(COV,arg_mean);
    case 'logeuclid'
        C = logeuclid_mean(COV);
    case 'opttransp'
        C = opttransp_mean(COV);
    case 'ld'
        C = logdet_mean(COV);    
    case 'geodesic'
        C = geodesic_mean(COV,arg_mean);
    otherwise
        C = mean(COV,3);
end
