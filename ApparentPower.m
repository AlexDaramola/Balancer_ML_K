function [apparentP] = ApparentPower(activeP, reactiveP)
  
  apparentP = zeros(size(activeP,1),1);
  for i = 1:length(activeP)
    apparentP(i) = sqrt((activeP(i).^2) + (reactiveP(i).^2));
  end

end