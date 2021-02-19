
if T==-30
    BattCapInit = max(oneC_243K_1Cycle_Ah(:,1)); % Ah Capacity from datasheet

elseif T==-20
    BattCapInit = max(oneC_253K_1Cycle_Ah(:,1)); % Ah Capacity from datasheet
elseif T==20
    BattCapInit = max(oneC_293K_1Cycle_Ah(:,1)); % Ah Capacity from datasheet
elseif T==60    
    BattCapInit = max(oneC_333K_1Cycle_Ah(:,1)); % Ah Capacity from datasheet
end

if T == 0
    BattCapInit = 2.62
end

Em=flipud(Em);

CapLUTBp=SOC_LUT;

RInt=R0_LUT_bkpts;

BattTempBp=T_LUT1;

%CapSOCBp=SOCbkpts;
CapSOCBp=[0 0.25 0.75 1];

%BattChargeMax=BattCapInit;


