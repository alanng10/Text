class Add : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.TextInfra : share TextInfra;
        this.StringComp : share StringComp;

        this.Format : this.CreateFormat();
        this.FormatArg : this.CreateFormatArg();
        this.IntParse : this.CreateIntParse();
        this.StringAdd : this.CreateStringAdd();

        this.CharLess : this.CreateCharLess();
        this.TForm : this.CreateTextForm();
        this.StringLess : this.CreateStringLess();

        inf (this.Text)
        {
            this.TLess : this.CreateTextLess();

            this.TextA : this.CreateText();
            this.TextB : this.CreateText();
            this.StringDataA : this.CreateStringData();
            this.StringDataB : this.CreateStringData();
        }
        return true;
    }

    maide precate Format CreateFormat()
    {
        var Format a;
        a : new Format;
        a.Init();
        return a;
    }

    maide precate FormatArg CreateFormatArg()
    {
        var FormatArg a;
        a : new FormatArg;
        a.Init();
        return a;
    }

    maide precate IntParse CreateIntParse()
    {
        var IntParse a;
        a : new IntParse;
        a.Init();
        return a;
    }

    maide precate StringAdd CreateStringAdd()
    {
        var StringAdd a;
        a : new StringAdd;
        a.Init();
        return a;
    }

    maide precate IntLess CreateCharLess()
    {
        var IntLess a;
        a : new IntLess;
        a.Init();
        return a;
    }

    maide precate TextForm CreateTextForm()
    {
        var TextForm a;
        a : new TextForm;
        a.Init();
        return a;
    }

    maide precate StringLess CreateStringLess()
    {
        var StringLess a;
        a : new StringLess;
        a.CharLess : this.CharLess;
        a.LiteForm : this.TForm;
        a.RiteForm : this.TForm;
        a.Init();
        return a;
    }

    maide precate TextLess CreateTextLess()
    {
        var TextLess a;
        a : new TextLess;
        a.CharLess : this.CharLess;
        a.LiteForm : this.TForm;
        a.RiteForm : this.TForm;
        a.Init();
        return a;
    }

    maide precate Text CreateText()
    {
        var Text a;
        a : new Text;
        a.Init();
        a.Range : new Range;
        a.Range.Init();
        return a;
    }

    maide precate StringData CreateStringData()
    {
        var StringData a;
        a : new StringData;
        a.Init();
        return a;
    }

    field prusate Bool Text { get { return data; } set { data : value; } }
    field precate TextInfra TextInfra { get { return data; } set { data : value; } }
    field precate StringComp StringComp { get { return data; } set { data : value; } }
    field precate Format Format { get { return data; } set { data : value; } }
    field precate FormatArg FormatArg { get { return data; } set { data : value; } }
    field precate IntParse IntParse { get { return data; } set { data : value; } }
    field precate StringAdd StringAdd { get { return data; } set { data : value; } }
    field precate StringLess StringLess { get { return data; } set { data : value; } }
    field precate TextLess TLess { get { return data; } set { data : value; } }
    field precate IntLess CharLess { get { return data; } set { data : value; } }
    field precate TextForm TForm { get { return data; } set { data : value; } }
    field precate Text TextA { get { return data; } set { data : value; } }
    field precate Text TextB { get { return data; } set { data : value; } }
    field precate StringData StringDataA { get { return data; } set { data : value; } }
    field precate StringData StringDataB { get { return data; } set { data : value; } }

    maide prusate Text TA(var String k)
    {
        return this.TextString(k, this.TextA, this.StringDataA);
    }

    maide prusate Text TB(var String k)
    {
        return this.TextString(k, this.TextB, this.StringDataB);
    }

    maide prusate Text TextString(var String k, var Text text, var StringData data)
    {
        data.ValueString : k;

        text.Data : data;
        text.Range.Index : 0;
        text.Range.Count : this.StringCount(k);
        return text;
    }

    maide prusate Bool TextSame(var Text text, var Text other)
    {
        return this.TextInfra.Same(text, other, this.TLess);
    }

    maide prusate Int StringCount(var String k)
    {
        return this.StringComp.Count(k);
    }

    maide prusate String StringBool(var Bool value)
    {
        var String a;
        
        inf (value)
        {
            a : this.TextInfra.TrueString;
        }
        inf (~value)
        {
            a : this.TextInfra.FalseString;
        }
        return a;
    }

    maide prusate String StringInt(var Int value)
    {
        return this.StringIntFormat(value, 10, false, 0, null, 0);
    }

    maide prusate String StringIntHex(var Int value)
    {
        return this.StringIntFormat(value, 16, false, 15, 15, this.Char("0"));
    }

    maide prusate String StringBoolFormat(var Bool bool, var Bool alignLeft, var Int fieldWidth, var Int maxWidth, var Int fillChar)
    {
        var FormatArg arg;
        arg : this.FormatArg;

        arg.Kind : 0;
        arg.Value : bool;
        arg.Base : 0;
        arg.AlignLeft : alignLeft;
        arg.FieldWidth : fieldWidth;
        arg.MaxWidth : maxWidth;
        arg.FillChar : fillChar;
        arg.Form : null;

        return this.StringFormat();
    }

    maide prusate String StringIntFormat(var Int int, var Int varBase, var Bool alignLeft, var Int fieldWidth, var Int maxWidth, var Int fillChar)
    {
        var FormatArg arg;
        arg : this.FormatArg;

        arg.Kind : 1;
        arg.Value : int;
        arg.Base : varBase;
        arg.AlignLeft : alignLeft;
        arg.FieldWidth : fieldWidth;
        arg.MaxWidth : maxWidth;
        arg.FillChar : fillChar;
        arg.Form : null;

        return this.StringFormat();
    }

    maide prusate String StringTextFormat(var Text text, var Bool alignLeft, var Int fieldWidth, var Int maxWidth, var Int fillChar)
    {
        var FormatArg arg;
        arg : this.FormatArg;

        arg.Kind : 2;
        arg.Value : text;
        arg.Base : 0;
        arg.AlignLeft : alignLeft;
        arg.FieldWidth : fieldWidth;
        arg.MaxWidth : maxWidth;
        arg.FillChar : fillChar;
        arg.Form : null;

        return this.StringFormat();
    }

    maide prusate String StringFormat()
    {
        var Bool b;

        b : this.Format.ExecuteArgCount(this.FormatArg);

        inf (~b)
        {
            return null;
        }

        var Text k;
        k : this.TextInfra.TextCreate(this.FormatArg.Count);

        b : this.Format.ExecuteArgResult(this.FormatArg, k);

        inf (~b)
        {
            return null;
        }

        var String a;
        a : this.StringCreate(k);

        return a;
    }

    maide prusate String StringCreate(var Text text)
    {
        return this.TextInfra.StringCreate(text);
    }

    maide prusate Int Char(var String k)
    {
        return this.TextInfra.Char(k);
    }

    maide prusate Text TextCreate(var String k)
    {
        return this.TextInfra.TextCreateStringData(k, null);
    }

    maide prusate Add AddClear()
    {
        this.StringAdd.Clear();
        return this;
    }

    maide prusate String AddResult()
    {
        return this.StringAdd.Result();
    }

    maide prusate Add Add(var String k)
    {
        this.TextInfra.AddString(this.StringAdd, k);
        return this;
    }

    maide prusate Add AddLine()
    {
        return this.Add(this.TextInfra.NewLine);
    }
}