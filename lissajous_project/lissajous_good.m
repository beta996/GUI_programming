function lissajous_good

global A

fig = figure('Position', [150 150 1200 800],'Color',[0.6350 0.0780 0.1840],'Name','Lissajous curve');
uicontrol('Style', 'Text',...
'String', 'Lissajous curve','BackgroundColor',[0.6350 0.0780 0.1840],...
'FontWeight','bold','Units','Normalized','Position', [0.4 0.94 0.2 0.05]);

%first input
h1 = uicontrol('Style', 'Edit',...
    'Units','Normalized','Position', [.15 .80 .25 .1]);

uicontrol('Style', 'Text', 'String', 'A =','BackgroundColor',[0.6350 0.0780 0.1840],...
    'Units','Normalized','Position', [.05 .78 .1 .1], 'FontSize',20);


uicontrol('Style','slider','Units','Normalized','Position', [.15 .8 .25 .02],...
    'Min',0,'Max',20,'Value',10,'SliderStep',[0.05 0.05],...
    'Callback',@updateText);







h2 = uicontrol('Style', 'Edit',...
    'Units','Normalized','Position', [.15 .65 .25 .1]);

uicontrol('Style', 'Text', 'String', 'B =','BackgroundColor',[0.6350 0.0780 0.1840],...
    'Units','Normalized','Position', [.05 .58 .1 .1], 'FontSize',20);


uicontrol('Style','slider','Units','Normalized','Position', [.15 .65 .25 .02],...
    'Min',0,'Max',20,'Value',10,'SliderStep',[0.05 0.05],...
    'Callback',@updateText);

h3 = uicontrol('Style', 'Edit',...
    'Units','Normalized','Position', [.15 .50 .25 .1]);

uicontrol('Style', 'Text', 'String', 'C =','BackgroundColor',[0.6350 0.0780 0.1840],...
    'Units','Normalized','Position', [.05 .38 .1 .1], 'FontSize',20);


uicontrol('Style','slider','Units','Normalized','Position', [.15 .5 .25 .02],...
    'Min',0,'Max',20,'Value',10,'SliderStep',[0.05 0.05],...
    'Callback',@updateText);

h4 = uicontrol('Style', 'Edit',...
    'Units','Normalized','Position', [.15 .35 .25 .1]);

uicontrol('Style', 'Text', 'String', 'B =','BackgroundColor',[0.6350 0.0780 0.1840],...
    'Units','Normalized','Position', [.05 .18 .1 .1], 'FontSize',20);


uicontrol('Style','slider','Units','Normalized','Position', [.15 .35 .25 .02],...
    'Min',0,'Max',20,'Value',10,'SliderStep',[0.05 0.05],...
    'Callback',@updateText);

h5 = uicontrol('Style', 'Edit',...
    'Units','Normalized','Position', [.15 .2 .25 .1]);

uicontrol('Style', 'Text', 'String', 'B =','BackgroundColor',[0.6350 0.0780 0.1840],...
    'Units','Normalized','Position', [.05 .18 .1 .1], 'FontSize',20);


uicontrol('Style','slider','Units','Normalized','Position', [.15 .2 .25 .02],...
    'Min',0,'Max',20,'Value',10,'SliderStep',[0.05 0.05],...
    'Callback',@updateText);

h6 = uicontrol('Style', 'Edit',...
    'Units','Normalized','Position', [.15 .05 .25 .1]);

uicontrol('Style', 'Text', 'String', 'B =','BackgroundColor',[0.6350 0.0780 0.1840],...
    'Units','Normalized','Position', [.05 .18 .1 .1], 'FontSize',20);


uicontrol('Style','slider','Units','Normalized','Position', [.15 .05 .25 .02],...
    'Min',0,'Max',20,'Value',10,'SliderStep',[0.05 0.05],...
    'Callback',@updateText);

uicontrol('Style', 'pushbutton', 'String', 'Start',...
    'Units','Normalized','Position', [.528 .04 .15 .1], 'Callback', @mycallback);








    function updateText(h,~)
        val = get(h,'Value');
        set(h1,'String',num2str(val))
    end


    function mycallback(src,evnt) %#ok<INUSD>
        ax = axes('Position',[.46 .17 .5 .76], 'Color',[0.6350 0.0780 0.1840]);
        % parameters value
        A = str2double(get(h1,'String'));
        a = str2double(get(h2,'String'));
        delta = str2double(get(h3,'String'));
        B = str2double(get(h4,'String'));
        b = str2double(get(h5,'String'));
        t = str2double(get(h6,'String'));
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