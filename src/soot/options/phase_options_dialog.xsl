<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" indent="no"/>
    <xsl:strip-space elements="*"/>

<xsl:template match="/options">

/*
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 *
 * This class is generated automajically from xml - DO NOT EDIT - as
 * changes will be over written
 * 
 * The purpose of this class is to automajically generate a options
 * dialog in the event that options change
 * 
 * Taking options away - should not damage the dialog
 * Adding new sections of options - should not damage the dialog
 * Adding new otpions to sections (of known option type) - should not
 * damage the dialog
 *
 * Adding new option types will break the dialog (option type widgets
 * will need to be created)
 *
 */

package ca.mcgill.sable.soot.testing;

import org.eclipse.jface.dialogs.IDialogSettings;
import org.eclipse.swt.widgets.*;
import org.eclipse.swt.*;
import org.eclipse.swt.layout.*;
import ca.mcgill.sable.soot.SootPlugin;
import java.util.HashMap;

public class PhaseOptionsDialog extends AbstractOptionsDialog {

	public PhaseOptionsDialog(Shell parentShell) {
		super(parentShell);
	}
	
	/**
	 * each section gets initialize as a stack layer in pageContainer
	 * the area containing the options
	 */ 
	protected void initializePageContainer() {

<!--add section pages-->
		<xsl:apply-templates mode="pageCon" select="/options/section"/>

		<xsl:for-each select="section">
		<!--<xsl:variable name="parent" select="translate(name[last()],'-. ','___')"/>-->
		<xsl:for-each select="phaseopt">
		<xsl:apply-templates mode="pageCon" select="phase"/>
		<xsl:for-each select="phase">
		<xsl:apply-templates mode="pageCon" select="sub_phase">
		<xsl:with-param name="parent" select="translate(alias[last()],'-. ','___')"/>
		</xsl:apply-templates>
		<xsl:variable name="sectionParent" select="translate(alias[last()],'-. ','___')"/>
		<xsl:for-each select="sub_phase">
		<xsl:apply-templates mode="pageCon" select="section">
		<xsl:with-param name="parent" select="$sectionParent"/>
		</xsl:apply-templates>
		
		</xsl:for-each>
		</xsl:for-each>
		</xsl:for-each>
		</xsl:for-each>
		
	}
	
	/**
	 * all options get saved as &#60;alias, value&#62; pair
	 */ 
	protected void okPressed() {
		IDialogSettings settings = SootPlugin.getDefault().getDialogSettings();
		<xsl:apply-templates mode="okPressed" select="/options/section"/>

		<xsl:for-each select="section">
		<!--<xsl:variable name="parent" select="translate(name[last()],'-. ','___')"/>-->
		<xsl:for-each select="phaseopt">
		<xsl:apply-templates mode="okPressed" select="phase"/>
		<xsl:for-each select="phase">
		<xsl:apply-templates mode="okPressed" select="sub_phase">
		<xsl:with-param name="parent" select="translate(alias[last()],'-. ','___')"/>
		</xsl:apply-templates>
		
		<xsl:variable name="sectionParent" select="translate(alias[last()],'-. ','___')"/>
		<xsl:for-each select="sub_phase">
		<xsl:apply-templates mode="okPressed" select="section">
		<xsl:with-param name="parent" select="$sectionParent"/>
		</xsl:apply-templates>
		
		
		</xsl:for-each>

		</xsl:for-each>
		</xsl:for-each>
		</xsl:for-each>


		super.okPressed();
				
	}

	protected HashMap savePressed() {
		HashMap config = new HashMap();
		<xsl:apply-templates mode="savePressed" select="/options/section"/>

		<xsl:for-each select="section">
		<!--<xsl:variable name="parent" select="translate(name[last()],'-. ','___')"/>-->
		<xsl:for-each select="phaseopt">
		<xsl:apply-templates mode="savePressed" select="phase"/>
		<xsl:for-each select="phase">
		<xsl:apply-templates mode="savePressed" select="sub_phase">
		<xsl:with-param name="parent" select="translate(alias[last()],'-. ','___')"/>
		</xsl:apply-templates>
		
		<xsl:variable name="sectionParent" select="translate(alias[last()],'-. ','___')"/>
		<xsl:for-each select="sub_phase">
		<xsl:apply-templates mode="savePressed" select="section">
		<xsl:with-param name="parent" select="$sectionParent"/>
		</xsl:apply-templates>
		
		
		</xsl:for-each>

		</xsl:for-each>
		</xsl:for-each>
		</xsl:for-each>
		
		return config;
	}
	


	/**
	 * the initial input of selection tree corresponds to each section
	 * at some point sections will have sub-sections which will be
	 * children of branches (ie phase - options)
	 */ 
	protected SootOption getInitialInput() {
		SootOption root = new SootOption("");
		SootOption parent;
		SootOption subParent;
		SootOption subSectParent;
		
<!--create branches for section pages-->
		<xsl:for-each select="section">
		SootOption <xsl:value-of select="translate(name[last()],'-. ','___')"/>_branch = new SootOption("<xsl:value-of select="name"/>");
		root.addChild(<xsl:value-of select="translate(name[last()],'-. ','___')"/>_branch);
		parent = <xsl:value-of select="translate(name[last()],'-. ','___')"/>_branch;		
		<xsl:for-each select="phaseopt">
		//<xsl:value-of select="name"/>
<!--create branches for phase pages-->
			<xsl:for-each select="phase">
			<xsl:variable name="parent" select="translate(alias[last()],'-. ','___')"/>
			//<xsl:value-of select="name"/>
			SootOption <xsl:value-of select="translate(alias[last()],'-. ','___')"/>_branch = new SootOption("<xsl:value-of select="name"/>");
			parent.addChild(<xsl:value-of select="translate(alias[last()],'-. ','___')"/>_branch);
			subParent = <xsl:value-of select="translate(alias[last()],'-. ','___')"/>_branch;
<!--create branches for sub-phase pages-->
			<xsl:for-each select="sub_phase">
			SootOption <xsl:value-of select="$parent"/>_<xsl:value-of select="translate(alias[last()],'-. ','___')"/>_branch = new SootOption("<xsl:value-of select="name"/>");
			subParent.addChild(<xsl:value-of select="$parent"/>_<xsl:value-of select="translate(alias[last()],'-. ','___')"/>_branch);
<!--create branches for sub-phase sub-section pages-->
			
			subSectParent = <xsl:value-of select="$parent"/>_<xsl:value-of select="translate(alias[last()],'-. ','___')"/>_branch;
			
			<xsl:for-each select="section">
			SootOption <xsl:value-of select="$parent"/>_<xsl:value-of select="translate((alias|name)[last()],'-. ','___')"/>_branch = new SootOption("<xsl:value-of select="name"/>");

			subSectParent.addChild(<xsl:value-of select="$parent"/>_<xsl:value-of select="translate((alias|name)[last()],'-. ','___')"/>_branch);
			</xsl:for-each>
			
			</xsl:for-each>
			</xsl:for-each>
		</xsl:for-each>
		
		</xsl:for-each>
		return root;
	
	}


		<xsl:apply-templates mode="objCreation" select="/options/section"/>

		<xsl:for-each select="section">
		<!--<xsl:variable name="parent" select="translate(name[last()],'-. ','___')"/>-->
		<xsl:for-each select="phaseopt">
		<xsl:apply-templates mode="objCreation" select="phase"/>
		<xsl:for-each select="phase">
		
		<xsl:apply-templates mode="objCreation" select="sub_phase">
		<xsl:with-param name="parent" select="translate(alias[last()],'-. ','___')"/>
		</xsl:apply-templates>
		
		<xsl:variable name="sectionParent" select="translate(alias[last()],'-. ','___')"/>
		<xsl:for-each select="sub_phase">
		<xsl:apply-templates mode="objCreation" select="section">
		<xsl:with-param name="parent" select="$sectionParent"/>
		</xsl:apply-templates>
		
		</xsl:for-each>

		</xsl:for-each>
		</xsl:for-each>
		</xsl:for-each>

<!--Component Initialization-->

		<xsl:for-each select="/options/section">
		<xsl:call-template name="compInit">
		<xsl:with-param name="subParent" select="translate(name[last()],'-. ','___')"/>
		<xsl:with-param name="name" select="name"/>
		</xsl:call-template>

		<xsl:for-each select="phaseopt">
		<xsl:variable name="phaseOptAlias" select="alias"/>
	
		<xsl:for-each select="phase">
		
		<xsl:call-template name="compInit">
		<xsl:with-param name="subParent" select="alias"/>
		<xsl:with-param name="parentAlias" select="$phaseOptAlias"/>
		<xsl:with-param name="subParentAlias" select="translate(alias[last()],'-. ','___')"/>
		<xsl:with-param name="name" select="name"/>
		</xsl:call-template>

		<xsl:variable name="phaseAlias" select="alias"/>

		<xsl:for-each select="sub_phase">
		
		<xsl:call-template name="compInit">
		<xsl:with-param name="parent" select="$phaseAlias"/>
		<xsl:with-param name="subParent" select="translate(alias[last()],'-. ','___')"/>
		<xsl:with-param name="parentAlias" select="$phaseOptAlias"/>
		<xsl:with-param name="subParentAlias" select="alias"/>
		<xsl:with-param name="name" select="name"/>
		</xsl:call-template>

		<xsl:variable name="subPhaseAlias" select="alias"/>
		<xsl:for-each select="section">
		
		<xsl:call-template name="compInit">
		<xsl:with-param name="parent" select="$phaseAlias"/>
		<xsl:with-param name="subParent" select="translate(name[last()],'-. ','___')"/>
		<xsl:with-param name="parentAlias" select="$phaseOptAlias"/>
		<xsl:with-param name="subParentAlias" select="$subPhaseAlias"/>
		<xsl:with-param name="name" select="name"/>
		</xsl:call-template>
		
		</xsl:for-each>
		</xsl:for-each>
		</xsl:for-each>
		
		</xsl:for-each>
		</xsl:for-each>


}

</xsl:template>

<!--PAGE CONTAINER CREATION TEMPLATE-->

<xsl:template mode="pageCon" match="section|phase|sub_phase">
<xsl:param name="parent"/>
<xsl:variable name="java_name" select="translate((alias|name)[last()],'-. ','___')"/>
Composite <xsl:copy-of select="$parent"/><xsl:copy-of select="$java_name"/>Child = <xsl:copy-of select="$parent"/><xsl:copy-of select="$java_name"/>Create(getPageContainer());
</xsl:template>
		
<!--SAVE PRESSED TEMPLATE-->

<xsl:template mode="savePressed" match="section|phase|sub_phase">
<xsl:param name="parent"/>
<xsl:variable name="subParent" select="translate((alias|name)[last()],'-. ','___')"/>


		<xsl:for-each select="boolopt|macroopt">
		config.put(get<xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget().getAlias(), new Boolean(get<xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget().getButton().getSelection()));
		</xsl:for-each>
		
		<xsl:for-each select="listopt">
		config.put(get<xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget().getAlias(), get<xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget().getText().getText());
		</xsl:for-each>
		
		<xsl:for-each select="stropt|intopt|flopt">
		config.put(get<xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget().getAlias(), get<xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget().getText().getText());
		</xsl:for-each>
		
		<xsl:for-each select="multiopt"> 
		config.put(get<xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget().getAlias(), get<xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget().getSelectedAlias());
		</xsl:for-each>
</xsl:template>	

	
<!--OK PRESSED TEMPLATE-->

<xsl:template mode="okPressed" match="section|phase|sub_phase">
<xsl:param name="parent"/>
<xsl:variable name="subParent" select="translate((alias|name)[last()],'-. ','___')"/>


		<xsl:for-each select="boolopt|macroopt">
		settings.put(get<xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget().getAlias(), get<xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget().getButton().getSelection());
		</xsl:for-each>
		
		<xsl:for-each select="listopt">
		settings.put(get<xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget().getAlias(), get<xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget().getText().getText());
		</xsl:for-each>
		
		<xsl:for-each select="stropt|intopt|flopt">
		settings.put(get<xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget().getAlias(), get<xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget().getText().getText());
		</xsl:for-each>
		
		<xsl:for-each select="multiopt"> 
		settings.put(get<xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget().getAlias(), get<xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget().getSelectedAlias());
		</xsl:for-each>

</xsl:template>	



<!--COMPOSITE INITIALIZATION TEMPLATE-->
<xsl:template name="compInit">

<xsl:param name="parent"/>
<xsl:param name="subParent"/>
<xsl:param name="parentAlias"/>
<xsl:param name="subParentAlias"/>

<xsl:param name="name"/>

	private Composite <xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/>Create(Composite parent) {
		String defKey;
		String defaultString;
		boolean defaultBool = false;
		
		Group editGroup = new Group(parent, SWT.NONE);
		GridLayout layout = new GridLayout();
		editGroup.setLayout(layout);
	
	 	editGroup.setText("<xsl:value-of select="$name"/>");
	 	OptionData [] data;	
		
<!--Boolean and Macro Widget-->		
		<xsl:for-each select="boolopt|macroopt">
		
		defKey = "<xsl:value-of select="$parentAlias"/>"+" "+"<xsl:value-of select="$subParentAlias"/>"+" "+"<xsl:value-of select="alias"/>";
		defKey = defKey.trim();

		if (isInDefList(defKey)) {
			defaultBool = getBoolDef(defKey);	
		}
		else {
			<xsl:if test="default">
			defaultBool = <xsl:value-of select="default"/>;
			</xsl:if>
			<xsl:if test="not(default)">
			defaultBool = false;
			</xsl:if>
		}

		set<xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget(new BooleanOptionWidget(editGroup, SWT.NONE, new OptionData("<xsl:value-of select="name"/>", "<xsl:value-of select="$parentAlias"/>", "<xsl:value-of select="$subParentAlias"/>","<xsl:value-of select="alias"/>", "<xsl:call-template name="string-replace"><xsl:with-param name="text" select="(short_desc|long_desc)"/><xsl:with-param name="from" select="'&#10;'"/><xsl:with-param name="to" select="'&#92;n'"/></xsl:call-template>", defaultBool)));
		
		</xsl:for-each>
		
<!--Multi Widget-->
		<xsl:for-each select="multiopt">
		
		data = new OptionData [] {
		<xsl:for-each select="value">
		new OptionData("<xsl:value-of select="name"/>",
		"<xsl:value-of select="alias"/>",
		"<xsl:value-of select="short_desc"/>",
		<xsl:if test="default">
		true),
		</xsl:if>
		<xsl:if test="not(default)">
		false),
		</xsl:if>
		
		</xsl:for-each>
		};
		
										
		set<xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget(new MultiOptionWidget(editGroup, SWT.NONE, data, new OptionData("<xsl:value-of select="name"/>", "<xsl:value-of select="$parentAlias"/>", "<xsl:value-of select="$subParentAlias"/>","<xsl:value-of select="alias"/>", "<xsl:call-template name="string-replace"><xsl:with-param name="text" select="(short_desc|long_desc)"/><xsl:with-param name="from" select="'&#10;'"/><xsl:with-param name="to" select="'&#92;n'"/></xsl:call-template>")));
		</xsl:for-each>
		
<!--Path Widget-->
		<xsl:for-each select="listopt">

		defKey = "<xsl:value-of select="$parentAlias"/>"+" "+"<xsl:value-of select="$subParentAlias"/>"+" "+"<xsl:value-of select="alias"/>";
		defKey = defKey.trim();

		if (isInDefList(defKey)) {
			defaultString = getStringDef(defKey);	
		}
		else {
			<xsl:if test="default">
			defaultString = "<xsl:value-of select="default"/>";
			</xsl:if>
			<xsl:if test="not(default)">
			defaultString = "";
			</xsl:if>
		}

		set<xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget(new ListOptionWidget(editGroup, SWT.NONE, new OptionData("<xsl:value-of select="name"/>",  "<xsl:value-of select="$parentAlias"/>", "<xsl:value-of select="$subParentAlias"/>","<xsl:value-of select="alias"/>", "<xsl:call-template name="string-replace"><xsl:with-param name="text" select="(short_desc|long_desc)"/><xsl:with-param name="from" select="'&#10;'"/><xsl:with-param name="to" select="'&#92;n'"/></xsl:call-template>", defaultString)));
		</xsl:for-each>
		
<!--String, Int and Float Widget-->
		<xsl:for-each select="stropt|intopt|flopt">
		
		defKey = "<xsl:value-of select="$parentAlias"/>"+" "+"<xsl:value-of select="$subParentAlias"/>"+" "+"<xsl:value-of select="alias"/>";
		defKey = defKey.trim();
		
		if (isInDefList(defKey)) {
			defaultString = getStringDef(defKey);	
		}
		else {
			<xsl:if test="default">
			defaultString = "<xsl:value-of select="default"/>";
			</xsl:if>
			<xsl:if test="not(default)">
			defaultString = "";
			</xsl:if>
		}

		set<xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget(new StringOptionWidget(editGroup, SWT.NONE, new OptionData("<xsl:value-of select="name"/>",  "<xsl:value-of select="$parentAlias"/>", "<xsl:value-of select="$subParentAlias"/>","<xsl:value-of select="alias"/>", "<xsl:call-template name="string-replace"><xsl:with-param name="text" select="(short_desc|long_desc)"/><xsl:with-param name="from" select="'&#10;'"/><xsl:with-param name="to" select="'&#92;n'"/></xsl:call-template>", defaultString)));
		</xsl:for-each>

		
		return editGroup;
	}

</xsl:template>

<!--OBJECT CREATION TEMPLATE-->

<xsl:template mode="objCreation" match="section|phase|sub_phase">

<xsl:param name="parent"/>
<xsl:variable name="subParent" select="translate((alias|name)[last()],'-. ','___')"/>

<!--Boolean and Macro Object Creation-->

	<xsl:for-each select="boolopt|macroopt">
	private BooleanOptionWidget <xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget;
	
	private void set<xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget(BooleanOptionWidget widget) {
		<xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget = widget;
	}
	
	public BooleanOptionWidget get<xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget() {
		return <xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget;
	}	
	</xsl:for-each>

<!--Path Object Creation-->

	<xsl:for-each select="listopt">

	private ListOptionWidget <xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget;
	
	private void set<xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget(ListOptionWidget widget) {
		<xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget = widget;
	}
	
	public ListOptionWidget get<xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget() {
		return <xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget;
	}	
	
	</xsl:for-each>

<!--String, Int and Float Object Creation-->

	<xsl:for-each select="stropt|intopt|flopt">
	
	private StringOptionWidget <xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget;
	
	private void set<xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget(StringOptionWidget widget) {
		<xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget = widget;
	}
	
	public StringOptionWidget get<xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget() {
		return <xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget;
	}
	
	</xsl:for-each>

	
<!--Multi Object Creation-->

	<xsl:for-each select="multiopt">
	
	private MultiOptionWidget <xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget;
	
	private void set<xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget(MultiOptionWidget widget) {
		<xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget = widget;
	}
	
	public MultiOptionWidget get<xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget() {
		return <xsl:value-of select="$parent"/><xsl:value-of select="$subParent"/><xsl:value-of select="translate(alias[last()],'-. ','___')"/>_widget;
	}	
	
	</xsl:for-each>
	

</xsl:template>

 <!-- reusable replace-string function -->
 <xsl:template name="string-replace">
    <xsl:param name="text"/>
    <xsl:param name="from"/>
    <xsl:param name="to"/>

    <xsl:choose>
      <xsl:when test="contains($text, $from)">

	<xsl:variable name="before" select="substring-before($text, $from)"/>
	<xsl:variable name="after" select="substring-after($text, $from)"/>
	<xsl:variable name="prefix" select="concat($before, $to)"/>

	<xsl:value-of select="$before"/>
	<xsl:value-of select="$to"/>
        <xsl:call-template name="string-replace">
	  <xsl:with-param name="text" select="$after"/>
	  <xsl:with-param name="from" select="$from"/>
	  <xsl:with-param name="to" select="$to"/>
	</xsl:call-template>
      </xsl:when> 
      <xsl:otherwise>
        <xsl:value-of select="$text"/>  
      </xsl:otherwise>
    </xsl:choose>            
 </xsl:template>

</xsl:stylesheet>