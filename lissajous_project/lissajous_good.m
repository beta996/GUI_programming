function lissajous_good
fig = figure('Position', [150 150 800 800],'Color',[0.6350 0.0780 0.1840],'Name','Lissajous curve');
uicontrol('Style', 'Text',...
'String', 'Lissajous curve','BackgroundColor',[0.6350 0.0780 0.1840],...
'FontWeight','bold','Units','Normalized','Position', [0.4 0.94 0.2 0.05]);

%first input
h1 = uicontrol('Style', 'Edit',...
    'Units','Normalized','Position', [.15 .80 .25 .1]);

uicontrol('Style', 'Text', 'String', 'A =','BackgroundColor',[0.6350 0.0780 0.1840],...
    'Units','Normalized','Position', [.05 .78 .1 .1], 'FontSize',20);


uicontrol('Style','slider','Units','Normalized','Position', [.15 .75 .25 .05],...
    'Min',0,'Max',20,'Value',10,'SliderStep',[0.05 0.05],...
    'Callback',@updateText);







h1 = uicontrol('Style', 'Edit',...
    'Units','Normalized','Position', [.15 .60 .25 .1]);

uicontrol('Style', 'Text', 'String', 'B =','BackgroundColor',[0.6350 0.0780 0.1840],...
    'Units','Normalized','Position', [.05 .58 .1 .1], 'FontSize',20);


uicontrol('Style','slider','Units','Normalized','Position', [.15 .55 .25 .05],...
    'Min',0,'Max',20,'Value',10,'SliderStep',[0.05 0.05],...
    'Callback',@updateText);

h1 = uicontrol('Style', 'Edit',...
    'Units','Normalized','Position', [.15 .40 .25 .1]);

uicontrol('Style', 'Text', 'String', 'C =','BackgroundColor',[0.6350 0.0780 0.1840],...
    'Units','Normalized','Position', [.05 .38 .1 .1], 'FontSize',20);


uicontrol('Style','slider','Units','Normalized','Position', [.15 .35 .25 .05],...
    'Min',0,'Max',20,'Value',10,'SliderStep',[0.05 0.05],...
    'Callback',@updateText);

h1 = uicontrol('Style', 'Edit',...
    'Units','Normalized','Position', [.15 .20 .25 .1]);

uicontrol('Style', 'Text', 'String', 'B =','BackgroundColor',[0.6350 0.0780 0.1840],...
    'Units','Normalized','Position', [.05 .18 .1 .1], 'FontSize',20);


uicontrol('Style','slider','Units','Normalized','Position', [.15 .15 .25 .05],...
    'Min',0,'Max',20,'Value',10,'SliderStep',[0.05 0.05],...
    'Callback',@updateText);

ax = axes('Position',[.46 .17 .7 .76], 'Color',[0.6350 0.0780 0.1840]);


    function updateText(h,~)
        val = get(h,'Value');
        set(h1,'String',num2str(val))
    end





end