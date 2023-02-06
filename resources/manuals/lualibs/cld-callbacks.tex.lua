---% language=uk
---
---\startcomponent cld-callbacks
---
---\environment cld-environment
---
---# Callbacks
---
---\startsection [title={Introduction}]
---
---\index {callbacks}
---
---The *LuaTeX* engine provides the usual basic *TeX* functionality plus a bit more.
---It is a deliberate choice not to extend the core engine too much. Instead all
---relevant processes can be overloaded by new functionality written in *Lua*. In
---*ConTeXt* callbacks are wrapped in a protective layer: on the one hand there is
---extra functionality (usually interfaced through macros) and on the other hand
---users can pop in their own handlers using hooks. Of course a plugged in function
---has to do the right thing and not mess up the data structures. In this chapter
---the layer on top of callbacks is described.
---
----------------------------------------------------------------


---
---\startsection [title={Actions}]
---
---\index {nodelists}
---
---Nearly all callbacks in *LuaTeX* are used in *ConTeXt*. In the following list the
---callbacks tagged with `enabled` are used and frozen, the ones tagged `disabled` are blocked and never used, while the ones tagged `undefined`
---are yet unused.
---
---% \ctxlua{callbacks.table()} % \ctxlua{callbacks.report()}
---\ctxcommand{showcallbacks()}
---
---Eventually all callbacks will be used so don't rely on undefined callbacks not
---being protected. Some callbacks are only set when certain functionality is
---enabled.
---
---It may sound somewhat harsh but if users kick in their own code, we cannot
---guarantee *ConTeXt*'s behaviour any more and support becomes a pain. If you really
---need to use a callback yourself, you should use one of the hooks and make sure
---that you return the right values.
---
---All callbacks related to file handling, font definition and housekeeping are
---frozen and cannot be overloaded. A reason for this are that we need some kind of
---protection against misuse. Another reason is that we operate in a well defined
---environment, the so called *TeX* directory structure, and we don't want to mess
---with that. And of course, the overloading permits *ConTeXt* to provide extensions
---beyond regular engine functionality.
---
---So as a fact we only open up some of the node list related callbacks and these
---are grouped as follows:
---
---\FL
--- \bf category  \bf callback  \bf usage 
---\TL
--- `processors`    `pre_linebreak_filter`   called just before the paragraph is broken into lines  `hpack_filter`           called just before a horizontal box is constructed 
--- `finalizers`    `post_linebreak_filter`  called just after the paragraph has been broken into lines 
--- `shipouts`      `no callback yet`        applied to the box (or xform) that is to be shipped out 
--- `mvlbuilders`   `buildpage_filter`       called after some material has been added to the main vertical list 
--- `vboxbuilders`  `vpack_filter`           called when some material is added to a vertical box 
---%NC `parbuilders`   `linebreak_filter`       called when a paragraph is to be broken into lines 
---%NC `pagebuilders`  `pre_output_filter`      called when a page it fed into the output routing 
--- `math`          `mlist_to_hlist`         called just after the math list is created, before it is turned into an horizontal list 
---\BL
---
---Each category has several subcategories but for users only two make sense: `before` and `after`. Say that you want to hook some tracing into the `mvlbuilder`. This is how it's done:
---
---```
---function third.mymodule.myfunction(where)
---    nodes.show_simple_list(tex.lists.contrib_head)
---end
---
---nodes.tasks.appendaction("processors", "before", "third.mymodule.myfunction")
---```
---
---As you can see, in this case the function gets no `head` passed (at least
---not currently). This example also assumes that you know how to access the right
---items. The arguments and return values are given below. \footnote {This interface
---might change a bit in future versions of *ConTeXt*. Therefore we will not discuss
---the few more optional arguments that are possible.}
---
---\FL
--- \bf category  \bf arguments  \bf return value 
---\TL
--- `processors`    `head, ...`  `head, done` 
--- `finalizers`    `head, ...`  `head, done` 
--- `shipouts`      `head`       `head, done` 
--- `mvlbuilders`                     `done`       
--- `vboxbuilders`  `head, ...`  `head, done` 
--- `parbuilders`   `head, ...`  `head, done` 
--- `pagebuilders`  `head, ...`  `head, done` 
--- `math`          `head, ...`  `head, done` 
---
----------------------------------------------------------------


---
---\startsection [title={Tasks}]
---
---\index {tasks}
---
---In the previous section we already saw that the actions are in fact tasks and
---that we can append (and therefore also prepend) to a list of tasks. The `before` and `after` task lists are valid hooks for users contrary to the
---other tasks that can make up an action. However, the task builder is generic
---enough for users to be used for individual tasks that are plugged into the user
---hooks.
---
---Of course at some point, too many nested tasks bring a performance penalty with
---them. At the end of a run \MKIV\ reports some statistics and timings and these
---can give you an idea how much time is spent in *Lua*.
---
---The following tables list all the registered tasks for the processors actions:
---
---\ctxlua{nodes.tasks.table("processors")}
---
---Some of these do have subtasks and some of these even more, so you can imagine
---that quite some action is going on there.
---
---The finalizer tasks are:
---
---\ctxlua{nodes.tasks.table("finalizers")}
---
---Shipouts concern:
---
---\ctxlua{nodes.tasks.table("shipouts")}
---
---There are not that many mvlbuilder tasks currently:
---
---\ctxlua{nodes.tasks.table("mvlbuilders")}
---
---The vboxbuilder perform similar tasks:
---
---\ctxlua{nodes.tasks.table("vboxbuilders")}
---
---In the future we expect to have more parbuilder tasks. Here again there are
---subtasks that depend on the current typesetting environment, so this is the right
---spot for language specific treatments.
---
---\ctxlua{nodes.tasks.table("parbuilders")}
---
---The following actions are applied just before the list is passed on the the
---output routine. The return value is a vlist.
---
---\ctxlua{nodes.tasks.table("pagebuilders")}
---
---{\em Both the parbuilders and pagebuilder tasks are unofficial and not yet meant
---for users.}
---
---Finally, we have tasks related to the math list:
---
---\ctxlua{nodes.tasks.table("math")}
---
---As \MKIV\ is developed in sync with *LuaTeX* and code changes from experimental
---to more final and reverse, you should not be too surprised if the registered
---function names change.
---
---You can create your own task list with:
---
---```
---nodes.tasks.new("mytasks",{ "one", "two" })
---```
---
---After that you can register functions. You can append as well as prepend them
---either or not at a specific position.
---
---```
---nodes.tasks.appendaction ("mytask","one","bla.alpha")
---nodes.tasks.appendaction ("mytask","one","bla.beta")
---
---nodes.tasks.prependaction("mytask","two","bla.gamma")
---nodes.tasks.prependaction("mytask","two","bla.delta")
---
---nodes.tasks.appendaction ("mytask","one","bla.whatever","bla.alpha")
---```
---
---Functions can also be removed:
---
---```
---nodes.tasks.removeaction("mytask","one","bla.whatever")
---```
---
---As removal is somewhat drastic, it is also possible to enable and disable
---functions. From the fact that with these two functions you don't specify a
---category (like `one` or `two`) you can conclude that the function
---names need to be unique within the task list or else all with the same name
---within this task will be disabled.
---
---```
---nodes.tasks.enableaction ("mytask","bla.whatever")
---nodes.tasks.disableaction("mytask","bla.whatever")
---```
---
---The same can be done with a complete category:
---
---```
---nodes.tasks.enablegroup ("mytask","one")
---nodes.tasks.disablegroup("mytask","one")
---```
---
---There is one function left:
---
---```
---nodes.tasks.actions("mytask",2)
---```
---
---This function returns a function that when called will perform the tasks. In this
---case the function takes two extra arguments in addition to `head`.
---\footnote {Specifying this number permits for some optimization but is not really
---needed}
---
---Tasks themselves are implemented on top of sequences but we won't discuss them
---here.
---
----------------------------------------------------------------


---
---\startsection [title={Paragraph and page builders}]
---
---Building paragraphs and pages is implemented differently and has no user hooks.
---There is a mechanism for plugins but the interface is quite experimental.
---
----------------------------------------------------------------


---
---\startsection [title={Some examples}]
---
---{\em todo}
---
----------------------------------------------------------------


---
---\stopchapter
---
---\stopcomponent
---