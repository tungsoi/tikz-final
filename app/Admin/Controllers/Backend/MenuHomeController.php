<?php

namespace App\Admin\Controllers\Backend;

use App\Http\Controllers\Controller;
use Brazzer\Admin\Controllers\HasResourceActions;
use Brazzer\Admin\Form;
use Brazzer\Admin\Grid;
use Brazzer\Admin\Layout\Content;
use Brazzer\Admin\Show;
use App\Models\MenuHome;
use Illuminate\Support\Str;

class MenuHomeController extends Controller
{
    use HasResourceActions;

    /**
     * Index interface.
     *
     * @param Content $content
     * @return Content
     */
    public function index(Content $content)
    {
        return $content
            ->header('Index')
            ->description('description')
            ->body($this->grid());
    }

    /**
     * Show interface.
     *
     * @param mixed   $id
     * @param Content $content
     * @return Content
     */
    public function show($id, Content $content)
    {
        return $content
            ->header('Detail')
            ->description('description')
            ->body($this->detail($id));
    }

    /**
     * Edit interface.
     *
     * @param mixed   $id
     * @param Content $content
     * @return Content
     */
    public function edit($id, Content $content)
    {
        return $content
            ->header('Edit')
            ->description('description')
            ->body($this->form()->edit($id));
    }

    /**
     * Create interface.
     *
     * @param Content $content
     * @return Content
     */
    public function create(Content $content)
    {
        return $content
            ->header('Create')
            ->description('description')
            ->body($this->form());
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new MenuHome);
        $grid->model()->orderBy('id', 'desc');
        $grid->filter(function($filter){
            $filter->expand();
            $filter->disableIdFilter();
            $filter->like('name');
        });

        $grid->quickCreate(function (Grid\Tools\QuickCreate $create) {
            $create->text('name');
            $create->integer('order');
        });

        $grid->id('ID')->sortable();
        $grid->name()->editable();
        $grid->code();
        $grid->order()->editable();
        $grid->path();

        $states = [
            'on' => ['value' => 1, 'text' => 'open', 'color' => 'primary'],
            'off' => ['value' => 0, 'text' => 'close', 'color' => 'default'],
        ];

        $grid->column('status')->switch($states);

        $grid->created_at('Created at');

        $grid->actions(function ($grid) {
            $grid->disableDelete(true);
        });

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed   $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(MenuHome::findOrFail($id));

        $show->id('ID');
        $show->name();
        $show->code();
        $show->order();
        $show->path();
        $show->status()->using([1 => 'Open', 0 => 'Close']);
        $show->created_at('Created at');
        $show->updated_at('Updated at');

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new MenuHome);

        $form->text('name');
        $form->text('code');
        $form->number('order');
        $form->text('path');

        $states = [
            'on' => ['value' => 1, 'text' => 'open', 'color' => 'primary'],
            'off' => ['value' => 0, 'text' => 'close', 'color' => 'default'],
        ];
        $form->switch('status')->states($states);

        $form->saving(function ($form){
            $form->code = Str::slug($form->name);
        });

        $form->saved(function ($form){
            $form->model()->code = Str::slug($form->model()->name);
            $form->model()->save();
        });

        $form->footer(function ($footer)
        {
            $footer->disableViewCheck();
            $footer->disableEditingCheck();
            $footer->disableCreatingCheck();
        });

        return $form;
    }
}
