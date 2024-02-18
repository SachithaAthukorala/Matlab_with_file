% i.
data=readtable('Student data.xlsx');

% ii.
scores=data{:,3:end};
average=mean(scores,2);

% iii.
grade=cell(length(average),1);
for i=1:length(average)
    % Determine the letter grade based on the average score
    if average(i) >= 75
        letterGrade = 'A';
    elseif average(i) >= 60
        letterGrade = 'B';
    elseif average(i) >= 40
        letterGrade = 'C';
    else
        letterGrade = 'F';
    end
    
    % Update the letter grade and report arrays
    grade{i} = letterGrade;
end

% iv
AboveC=average>=40;
NoPassed=sum(AboveC);

%Alternative method ************
% NoPassed=0;
% for i=1:length(average)
%     if average(i)>=40
%         NoPassed=NoPassed+1;
%     end
% end
%**********************************

fprintf('Nmber of passed students: %d \n', NoPassed)

% v.
summary = table(data{:,1},grade,'VariableNames',{'StudentID','Grade'});
writetable(summary,'summary.txt')
