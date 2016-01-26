require 'gnuplot'


local sample_sent = 'I want to go'
local vec1 = torch.rand(len)

function plot(sent, vec, filename)
    if filename == nil then
        gnuplot.figure(1)
    else
        gnuplot.epsfigure(filename)
    end
--gnuplot.figure(1)

len = #sent

-- setting command for tics
-- one character for each tic
command_tics = 'set xtics ('
for i=1,len do
    local ch = sent:sub(i,i)
    command_tics = command_tics .. '"' .. ch .. '" ' .. i .. ', '
end
command_tics = command_tics .. ')'
print('The command for tics = ')
print(command_tics)

gnuplot.plot(vec)
gnuplot.raw(command_tics)
gnuplot.plotflush()
gnuplot.axis{0,len+1,0, ''}
gnuplot.grid(true)
gnuplot.title('Heat Map over Characters')
gnuplot.plotflush()
end
