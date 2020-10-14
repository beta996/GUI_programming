function lissajous_good1

global delta
global A
global B



fig = figure('Color',[0 0 0],'Units','Normalized','Position',...
    [0.2805 0.3463 0.8375 0.8250],'menu','no','Name','Lissajous curve');

folder = '/home/beata/Documents/';
fileList = dir(fullfile(folder, '/*.tiff'));
fullFileName = fullfile(fileList(1).folder, fileList(1).name)
%picture = imread(fullFileName);
%imshow(picture);


a = axes('Position',[0 0 0.5 1],'Units','Normalized');
 imshow(fullFileName,'Parent',a);



hh = uicontrol('Style', 'Text', 'String', 'Lissajous curve',...
   'FontWeight','bold',...
    'Units','Normalized','Position', [.6 .94 .2 .05], 'FontSize', 25, 'FontUnits', 'centimeters');
set(hh,'ForegroundColor','blue', 'BackgroundColor', 'black');

frml = uicontrol('Style', 'Text', 'String', 'x(t) = A*sin(a*t + delta), y(t) = B*sin(b{*t)',...
    'BackgroundColor',[1 1 1],'FontWeight','bold',...
    'Units','Normalized','Position', [.6 .84 .2 .05], 'FontSize', 15, 'FontUnits', 'centimeters');

set(frml,'ForegroundColor','white', 'BackgroundColor', 'black');

% a input

in1 = uicontrol('Style', 'Edit',...
    'Units','Normalized','Position', [.7 .70 .15 .04]);
input1 = uicontrol('Style', 'Text', 'String', 'a =','BackgroundColor',[1 1 1],...
    'Units','Normalized','Position', [.65 .68 .05 .05], 'FontSize',15);

set(input1,'ForegroundColor','white', 'BackgroundColor', 'black');


% b input

in2 = uicontrol('Style', 'Edit',...
    'Units','Normalized','Position', [.7 .6 .15 .04]);
input2 = uicontrol('Style', 'Text', 'String', 'b =','BackgroundColor',[1 1 1],...
    'Units','Normalized','Position', [.65 .58 .05 .05], 'FontSize',15);
set(input2,'ForegroundColor','white', 'BackgroundColor', 'black');

% A input

uicontrol('Style','slider','Units','Normalized','Position', [.7 .5 .2 .02],...
    'Min',0,'Max',20,'Value',10,'SliderStep',[0.05 0.05],...
    'Callback',@setAValue);

input3 = uicontrol('Style', 'Text', 'String', 'A =','BackgroundColor',[1 1 1],...
    'Units','Normalized','Position', [.65 .47 .05 .05], 'FontSize',15);
set(input3,'ForegroundColor','white', 'BackgroundColor', 'black');


% B input

uicontrol('Style','slider','Units','Normalized','Position', [.7 .45 .2 .02],...
    'Min',0,'Max',20,'Value',10,'SliderStep',[0.05 0.05],...
    'Callback',@setBValue);

input4 = uicontrol('Style', 'Text', 'String', 'B =','BackgroundColor',[1 1 1],...
    'Units','Normalized','Position', [.65 .42 .05 .05], 'FontSize',15);
set(input4,'ForegroundColor','white', 'BackgroundColor', 'black');

deltas = {'pi/4', 'pi/2', 'pi/16', 'pi'};

 for k=1:4; 
    cbh(k) = uicontrol('Style','checkbox','String', deltas(k), ...
                        'Units','Normalized',...
                       'Value',0,'Position',[.72 (.4 - k*0.06) 0.1 0.1],        ...
                        'Callback',{@checkBoxCallback,k}, 'BackgroundColor',[1 1 1]);
 end


 
deltaInput = uicontrol('Style', 'Text', 'String', 'delta =','BackgroundColor',[1 1 1],...
    'Units','Normalized','Position', [.65 .28 .05 .05], 'FontSize',15);
set(deltaInput,'ForegroundColor','white', 'BackgroundColor', 'black');

btn = uicontrol('Style', 'pushbutton', 'String', 'Start',...
    'Units','Normalized','Position', [.658 .04 .15 .1], 'Callback', @mycallback);

set(btn,'ForegroundColor','white', 'BackgroundColor', 'black');
set(cbh,'ForegroundColor','white', 'BackgroundColor', 'black');



function setAValue(h,~)
        A = get(h,'Value');
end


function setBValue(h,~)
        B = get(h,'Value');
end


 function checkBoxCallback(hObject,~,checkBoxId)
    value = get(hObject,'Value');
    if value
        switch checkBoxId
            case 1
                delta = pi/4;
            case 2
                delta = pi/2;
            case 3
                delta = pi/16;
            case 4
                delta = pi;
        end
    end
    
 end



function mycallback(src,evnt) 
        ax = axes('Position',[.07 .27 .5 .5], 'Color',[0 0 0]);
        % parameters value
        % A = str2double(get(A,'String'));
        a = str2double(get(in1,'String'));
        b = str2double(get(in2,'String'));
        t = 4;
        % checking paramters values
        if isnan(A)
            A = 1;
        end
        if isnan(a)
            f = warndlg('Only numbers allowed!','Warning');
        end
        if isnan(delta)
            f = warndlg('Only numbers allowed!','Warning');
        end
        if isnan(B)
            f = warndlg('Only numbers allowed!','Warning');
        end
        if isnan(b)
            f = warndlg('Only numbers allowed!','Warning');
        end
        if isnan(t)
            f = warndlg('Only numbers allowed!','Warning');
        end
        
        T = 0:.01:t*pi;
        x = A*sin(a*T + delta);
        y = B*sin(b*T);
        
        %plot Lissajous curve
        comet(ax,x,y,0.2);
    end % mycallback




end